package tests;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;


@RunWith(Parameterized.class)
public class ValidationEmailTest {
	private EmailValidator emailValidator;
	 
	@BeforeClass
	public void initData() {
		emailValidator = new EmailValidator();
	}
 
	@Parameterized.Parameters
	public Object[][] ValidEmailProvider() {
		return new Object[][] { { new String[] { "mkyong@yahoo.com",
			"mkyong-100@yahoo.com", "mkyong.100@yahoo.com",
			"mkyong111@mkyong.com", "mkyong-100@mkyong.net",
			"mkyong.100@mkyong.com.au", "mkyong@1.com",
			"mkyong@gmail.com.com", "mkyong+100@gmail.com",
			"mkyong-100@yahoo-test.com" } } };
	}
 
	@Parameterized.Parameters
	public Object[][] InvalidEmailProvider() {
		return new Object[][] { { new String[] { "mkyong", "mkyong@.com.my",
			"mkyong123@gmail.a", "mkyong123@.com", "mkyong123@.com.com",
			".mkyong@mkyong.com", "mkyong()*@gmail.com", "mkyong@%*.com",
			"mkyong..2002@gmail.com", "mkyong.@gmail.com",
			"mkyong@mkyong@gmail.com", "mkyong@gmail.com.1a" } } };
	}
 
	//TODO adapter avec JUnit
	@Test(dataProvider = "ValidEmailProvider")
	public void ValidEmailTest(String[] Email) {
 
		for (String temp : Email) {
			boolean valid = emailValidator.validate(temp);
			System.out.println("Email is valid : " + temp + " , " + valid);
			Assert.assertEquals(valid, true);
		}
 
	}
 
	@Test(dataProvider = "InvalidEmailProvider", dependsOnMethods = "ValidEmailTest")
	public void InValidEmailTest(String[] Email) {
 
		for (String temp : Email) {
			boolean valid = emailValidator.validate(temp);
			System.out.println("Email is valid : " + temp + " , " + valid);
			Assert.assertEquals(valid, false);
		}
	}
}