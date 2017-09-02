package biz.denfox.web.dao;

import biz.denfox.web.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Customer> getCustomers() {

        return sessionFactory
                .getCurrentSession()
                .createQuery("from Customer order by lastName ", Customer.class)
                .getResultList();
    }

    public Customer getCustomer(int id) {
        return sessionFactory.getCurrentSession().get(Customer.class, id);
    }

    public void addCustomer(Customer customer) {
        sessionFactory.getCurrentSession().save(customer);
    }

    @Override
    public void updateCustomer(Customer customer) {
        System.out.println("Inside DAO: " + customer);
        sessionFactory.getCurrentSession().update(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        Session currentSession = sessionFactory.getCurrentSession();

        Customer customer = currentSession.get(Customer.class, id);
        currentSession.delete(customer);
    }
}
