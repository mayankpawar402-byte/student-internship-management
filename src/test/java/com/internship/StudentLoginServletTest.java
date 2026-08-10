package com.internship;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class StudentLoginServletTest {

    @Test
    void loginInputValidationTest() {
        String email = "student@gmail.com";
        String password = "123456";

        assertNotNull(email);
        assertFalse(email.isBlank());

        assertNotNull(password);
        assertFalse(password.isBlank());
    }

    @Test
    void invalidEmptyEmailTest() {
        String email = "";

        assertTrue(email.isBlank());
    }

    @Test
    void invalidEmptyPasswordTest() {
        String password = "";

        assertTrue(password.isBlank());
    }
}
