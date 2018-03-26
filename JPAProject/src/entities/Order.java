package entities;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

@Entity
@Table(name="order")
public class Order {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="date_created")
	@Temporal(TemporalType.DATE)
	private Date dateCreated;
	
	@Column(name="total_price")
	private double totalPrice;
	
	@Column(name="order_status")
	private boolean orderStatus;
	
	@Column(name="shipping_address")
	private String shippingAddress;
	
	@Column(name="billing_address")
	private String billingAddress;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	//customer_id`
}
