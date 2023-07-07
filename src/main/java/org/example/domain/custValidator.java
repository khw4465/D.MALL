package org.example.domain;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class custValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        // return User.class.equals(clazz); // 검증하려는 객체가 User타입인지 확인
        return CustDto.class.isAssignableFrom(clazz); // clazz가 CustDto 또는 그 자손인지 확인
    }

    @Override
    public void validate(Object target, Errors errors) {
        if (target instanceof CustDto) {
            CustDto custDto = (CustDto) target;
            String id = custDto.getCustId();
            //String pwd = custDto.getPwd();

            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "custId", "required");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pwd", "required");

            if (id == null || id.length() < 4 || id.length() > 20) {
                errors.rejectValue("custId", "required");
                System.out.println("id를 다시 입력해주세요");
            }
        } else {
            // CustDto가 아닌 다른 타입의 객체가 전달되면 예외를 발생시키는 등의 대응이 필요
            throw new IllegalArgumentException("Invalid type: " + target.getClass().getName());
        }
    }
}

//        CustDto custDto = (CustDto)target;
//        //User user =(User)target;
//        System.out.println("user.getCust_id(2) = " + custDto.getCustId());
//        System.out.println("user.getPwd(2) = " + custDto.getPwd());
//        String id = custDto.getCustId();
//        String pwd = custDto.getPwd();
//        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"custId","required");
//        if(id==null || id.length()<4 || id.length()>20){
//            errors.rejectValue("custId","required");
//            System.out.println("id다시쳐주세요");
//        }