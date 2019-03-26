package kr.or.ddit.listener;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Component
public class LoginSessionListener implements HttpSessionListener,
		HttpSessionAttributeListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		if (se.getSession().getAttribute("USER_LOGININFO") != null) {
			// if (se.getSession().getAttribute("USER_LOGININFO") instanceof
			// MemberVO) {
			WebApplicationContext context = WebApplicationContextUtils
					.getWebApplicationContext(se.getSession()
							.getServletContext());
			DataSourceTransactionManager txManager = (DataSourceTransactionManager) context
					.getBean("transactionMgr");
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus txStatus = txManager.getTransaction(def);
			try {
				IMemberService memService = context
						.getBean(IMemberService.class);
				MemberVO memberInfo = (MemberVO) se.getSession().getAttribute(
						"USER_LOGININFO");
				Map<String, String> params = new HashMap<String, String>();
				params.put("mem_id", memberInfo.getMem_id());
				try {
					memService.updateLogin(params);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				txManager.rollback(txStatus);
				e.printStackTrace();
			}
			txManager.commit(txStatus);
			// }
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if (se.getSession().getAttribute("USER_LOGININFO") != null) {
			// if (se.getSession().getAttribute("USER_LOGININFO")
			// instanceof MemberVO) {
			WebApplicationContext context = WebApplicationContextUtils
					.getWebApplicationContext(se.getSession()
							.getServletContext());
			DataSourceTransactionManager txManager = (DataSourceTransactionManager) context
					.getBean("transactionMgr");
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus txStatus = txManager.getTransaction(def);
			try {
				IMemberService memService = context
						.getBean(IMemberService.class);
				MemberVO memberInfo = (MemberVO) se.getSession().getAttribute(
						"USER_LOGININFO");
				Map<String, String> params = new HashMap<String, String>();
				params.put("mem_id", memberInfo.getMem_id());
				try {
					memService.updateLogout(params);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				txManager.rollback(txStatus);
				e.printStackTrace();
			}
			txManager.commit(txStatus);
			// }
		}
	}

	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		if (se.getValue() instanceof MemberVO) {
			WebApplicationContext context = WebApplicationContextUtils
					.getWebApplicationContext(se.getSession()
							.getServletContext());
			DataSourceTransactionManager txManager = (DataSourceTransactionManager) context
					.getBean("transactionMgr");
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus txStatus = txManager.getTransaction(def);
			try {
				IMemberService memService = context
						.getBean(IMemberService.class);
				MemberVO memberInfo = (MemberVO) se.getSession().getAttribute(
						"USER_LOGININFO");
				Map<String, String> params = new HashMap<String, String>();
				params.put("mem_id", memberInfo.getMem_id());
				try {
					memService.updateLogin(params);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				txManager.rollback(txStatus);
				e.printStackTrace();
			}
			txManager.commit(txStatus);
		}

	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		if (se.getValue() instanceof MemberVO) {
			WebApplicationContext context = WebApplicationContextUtils
					.getWebApplicationContext(se.getSession()
							.getServletContext());
			DataSourceTransactionManager txManager = (DataSourceTransactionManager) context
					.getBean("transactionMgr");
			DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			TransactionStatus txStatus = txManager.getTransaction(def);
			try {
				IMemberService memService = context
						.getBean(IMemberService.class);
				MemberVO memberInfo = (MemberVO) se.getSession().getAttribute(
						"USER_LOGININFO");
				Map<String, String> params = new HashMap<String, String>();
				params.put("mem_id", memberInfo.getMem_id());
				try {
					memService.updateLogout(params);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				txManager.rollback(txStatus);
				e.printStackTrace();
			}
			txManager.commit(txStatus);
		}
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {

	}

}
