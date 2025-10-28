package com.supremesolutions.quote_service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Profile("dev")  // Add this line
public class QuoteTestController {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @GetMapping("/test-redis")
    public String testRedis() {
        try {
            redisTemplate.opsForValue().set("quote_test", "Hello from Quote Service!");
            String value = redisTemplate.opsForValue().get("quote_test");
            return "✅ Redis Connected (Quote Service)! Value: " + value;
        } catch (Exception e) {
            return "❌ Redis connection failed: " + e.getMessage();
        }
    }
}
