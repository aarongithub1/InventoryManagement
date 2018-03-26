package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class Customer {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String username;
	private String email;
	
	@Column(name="shipping_address")
	private String shippingAddress;
	@Column(name="billing_address")
	private String billingAddress;
	
	@OneToOne
	@JoinColumn(name="cart_id")
	private Cart cart;
	
	
}

















