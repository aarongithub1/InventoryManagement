package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Orders;

public class OrdersTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Orders o;
	
	@Before
	public void setUp() {
		this.emf = Persistence.createEntityManagerFactory("inventoryManagementPU");
		this.em = emf.createEntityManager();
		o = em.find(Orders.class, 1);
	}
	
	@After
	public void tearDown() {
		em.close();
		emf.close();
		o = null;
	}
	
	@Test
	public void smoke_test() {
		boolean test = true;
		assertEquals(true, test);
	}
	
	@Test
	public void test_orders_customer_connection() {
		assertEquals("adam", o.getCustomer().getName());
		assertEquals("a@a.com", o.getCustomer().getEmail());
		assertEquals(1, o.getCustomer().getOrders().get(0).getCustomer().getId());
	}
	
	@Test
	public void test_orders_product_connection() {
		assertEquals(3, o.getProducts().size());
		assertEquals("coffee mug", o.getProducts().get(1).getName());
		assertEquals(1, o.getProducts().get(0).getOrders().get(0).getId());
		assertEquals(2, o.getProducts().get(0).getOrders().get(1).getId());
	}

}





















