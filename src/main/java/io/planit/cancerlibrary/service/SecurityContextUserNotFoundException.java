package io.planit.cancerlibrary.service;

class SecurityContextUserNotFoundException extends RuntimeException {
    SecurityContextUserNotFoundException() {
        super("No user was found in the security context");
    }
}
