package com.veltrix.app.controller;

import java.time.LocalDateTime;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
    
    @GetMapping("/")
    public String home() {
        log.info("Home page accessed: {}", LocalDateTime.now());
        return "Welcome to Veltrix Application!";
    }
}
