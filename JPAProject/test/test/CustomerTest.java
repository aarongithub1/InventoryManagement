package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Customer;
	
public class CustomerTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Customer c;
	
	@Before
	public void setUp() {
		this.emf = Persistence.createEntityManagerFactory("inventoryManagementPU");
		this.em = emf.createEntityManager();
		c = em.find(Customer.class, 1);
	}
	
	@After
	public void tearDown() {
		em.close();
		emf.close();
		c = null;
	}
	
	@Test
	public void smoke_test() {
		boolean test = true;
		assertEquals(true, test);
	}
	
	@Test
	public void test_customer_order_connection() {
		assertEquals(1, c.getOrders().size());
		assertEquals("shipped", c.getOrders().get(0).getOrderStatus().toString());
		assertEquals("adam", c.getName().toString());
	}

}


















