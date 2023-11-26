package com.springboot.dtod.contactus.service;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.dtod.contactus.domain.Consultation;
import com.springboot.dtod.contactus.repository.ConRepository;

import lombok.RequiredArgsConstructor;

//기능을 정의할 수 있고, 트랜잭션을 관리할 수 있음. 
@RequiredArgsConstructor
@Service
public class ConService {
	
	// 함수 => 송금() -> 레파지토리에 여러개의 함수 실행 -> commit or rollback
	private final ConRepository conRepository;
	
	@Transactional // 서비스 함수가 종료될 때 commit할지 rollback할지 트랜잭션 관리하겠다. 
	public Consultation 저장하기(Consultation con) {
		return conRepository.save(con);
	}

}
