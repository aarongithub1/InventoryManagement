package test;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import entities.Product;

public class ProductTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Product p;
	
	@Before
	public void setUp() {
		this.emf = Persistence.createEntityManagerFactory("inventoryManagementPU");
		this.em = emf.createEntityManager();
		this.p = em.find(Product.class, 1);
	}
	
	@After
	public void tearDown() {
		em.close();
		emf.close();
		p = null;
	}
	
	@Test
	public void smokeTest() {
		boolean test = true;
		assertEquals(true, test);
	}
	
	@Test
	public void test_product_orders_connection() {
		assertEquals(1, p.getOrders().get(0).getId());
		assertEquals(2, p.getOrders().get(1).getId());
	}
	
	@Test
	public void test_product_customer_connection() {
		assertEquals(1, p.getOrders().get(0).getCustomer().getId());
		assertEquals(2, p.getOrders().get(1).getCustomer().getId());
	}

}

























