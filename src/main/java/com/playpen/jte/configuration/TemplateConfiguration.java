package com.playpen.jte.configuration;

import gg.jte.ContentType;
import gg.jte.TemplateEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

@Configuration
@Profile("prod")
class TemplateConfiguration {

    private final Logger logger = LoggerFactory.getLogger(TemplateConfiguration.class);

    @Bean
    public TemplateEngine templateEngine() {
        logger.info("Creating precompiled template engine");
        return TemplateEngine.createPrecompiled(ContentType.Html);
    }
}
