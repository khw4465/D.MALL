package org.example.dao;

import org.example.domain.*;

import java.util.List;

public interface CustDao {
    CustDto selectUser(String id) throws Exception;
    // 회원아이디를 주면 셀렉트가 작동해서 로그인한다.
    int insertUser(CustDto custDto) throws Exception;
    // user정보를 주면 db에 insert가 적용된다. 성공시 int값 반환해서 알려줌
    int deleteUser(String id) throws Exception;
    // id를 주면 user 를 삭제한다. 결과로 int를 반환
    int updateUser(CustDto custDto) throws Exception;
    // id를 주면 user를 업데이트한다. 성공시 int반환
    List<CustDto> selectAllUser() throws Exception;
    // 모든 회원정보를 조회한다.
    int deleteAll() throws Exception; //반환값 필요없음
    // 모든 회원정보를 삭제한다.
    int count() throws Exception; //int형으로 개수 나와야함.
    // 모든 회원수를 조회한다.
    String findid(CustDto custDto) throws Exception;
    //custDto를 주면 id를 찾아준다.
    CustDto modifyselect(String id) throws Exception;
    // 회원아이디를 주면 셀렉트가 작동해서 로그인한다.
    CustDto temporaryPwd(CustDto dto) throws Exception;
    // 아이디,이름,이메일,전화번호를 입력하면 임시비밀번호를 발급하는 로직
    int temporaryPwdReturn(CustDto dto)throws Exception;
    //
}