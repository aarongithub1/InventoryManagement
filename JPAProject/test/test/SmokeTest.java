package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SmokeTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	
	@Before
	public void setUp() {
		this.emf = Persistence.createEntityManagerFactory("inventoryManagementPU");
		this.em = emf.createEntityManager();
	}
	
	@After
	public void tearDown() {
		em.close();
		emf.close();
	}
	
	@Test
	public void smokeTest() {
		boolean test = true;
		assertEquals(true, test);
	}

}





















