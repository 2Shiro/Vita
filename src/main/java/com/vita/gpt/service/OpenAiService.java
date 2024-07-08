package com.vita.gpt.service;

import java.io.IOException;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;



@Service
public class OpenAiService {

    @Value("${openai.api.key}")
    private String openAiApiKey;

    @Value("${openai.model}")
    private String openAiModel;

    public String getComparison(String prompt) throws IOException {
        String apiUrl = "https://api.openai.com/v1/chat/completions";

        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost(apiUrl);
        httpPost.setHeader("Content-Type", "application/json; charset=UTF-8");
        httpPost.setHeader("Authorization", "Bearer " + openAiApiKey);

        JSONObject json = new JSONObject();
        json.put("model", openAiModel);

        JSONArray messages = new JSONArray();
        JSONObject message = new JSONObject();
        message.put("role", "user");
        message.put("content", prompt);
        messages.put(message);

        json.put("messages", messages);
        json.put("max_tokens", 2000);

        StringEntity entity = new StringEntity(json.toString(), "UTF-8");
        httpPost.setEntity(entity);

        String response = EntityUtils.toString(httpClient.execute(httpPost).getEntity(), "UTF-8");

        // 응답 데이터 로그 출력
        System.out.println("OpenAI API 응답: " + response);

        JSONObject jsonResponse = new JSONObject(response);
        if (jsonResponse.has("choices")) {
            return jsonResponse.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");
        } else if (jsonResponse.has("error")) {
            String errorMessage = jsonResponse.getJSONObject("error").getString("message");
            System.err.println("OpenAI API 에러: " + errorMessage);
            throw new IOException("OpenAI API 에러: " + errorMessage);
        } else {
            throw new IOException("OpenAI API 응답에 'choices' 키가 없습니다.");
        }
    }

    
}