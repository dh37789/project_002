package kr.or.ddit.listener;

import java.util.HashMap;

import kr.or.ddit.frMyProject.service.ProjectService;
import kr.or.ddit.member.service.IMemberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Component
public class SqlUpdateListener implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private ProjectService service;
	
	@Autowired
	private DataSourceTransactionManager txManager;  

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus txStatus = txManager.getTransaction(def);
		try {
			service.updateContract();
		} catch (Exception e) {
			txManager.rollback(txStatus);
			e.printStackTrace();
		}
		txManager.commit(txStatus);
	}

}
