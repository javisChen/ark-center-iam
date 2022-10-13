package com.ark.center.iam.spring;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class TransactionTest {

    @Test
    public void test() {
        ApplicationContext context = new AnnotationConfigApplicationContext("com.ark.center.iam.spring");
        UserService bean = context.getBean(UserService.class);
        bean.save();
    }
}