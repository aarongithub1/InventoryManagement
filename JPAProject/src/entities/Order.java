package entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
	private String orderStatus;
	
	@Column(name="shipping_address")
	private String shippingAddress;
	
	@Column(name="billing_address")
	private String billingAddress;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@ManyToMany(fetch = FetchType.EAGER, cascade= {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinTable(name="order_product",
			joinColumns = @JoinColumn(name="order_id"),
			inverseJoinColumns = @JoinColumn(name="product_id"))
	private List<Product> products;
	
	
	//GETTERS AND SETTERS
	public int getId() {
		return id;
	}
	
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
	public String getBillingAddress() {
		return billingAddress;
	}
	public void setBillingAddress(String billingAddress) {
		this.billingAddress = billingAddress;
	}
	
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	
	
	// toString
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Order [id=");
		builder.append(id);
		builder.append(", dateCreated=");
		builder.append(dateCreated);
		builder.append(", totalPrice=");
		builder.append(totalPrice);
		builder.append(", orderStatus=");
		builder.append(orderStatus);
		builder.append(", shippingAddress=");
		builder.append(shippingAddress);
		builder.append(", billingAddress=");
		builder.append(billingAddress);
		builder.append(", Customer=");
		builder.append(customer);
		builder.append("]");
		return builder.toString();
	}
	
	
}





















