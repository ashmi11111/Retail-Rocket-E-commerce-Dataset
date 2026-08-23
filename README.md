# E-Commerce Funnel Analysis: Identifying Drop-Offs and Revenue Opportunities

## **Overview**. 
This project analyzes user behavior on an e-commerce platform to understand where and why customers drop off between browsing and purchasing. Using the RetailRocket dataset ~2.7M anonymized user events spanning 4.5 months, I reconstruct the view to add-to-cart to purchase funnel, segment it to find where conversion breaks down, and translate the findings into concrete recommendations.

### **Business Question**

E-commerce platforms lose the vast majority of potential revenue not at the point of sale, but in the steps leading up to it. If a customer views a product, maybe adds it to their cart, and then leaves without buying. Every one of those drop-offs represents lost revenue and a signal about what's not working in the shopping experience.

### **Primary question:** 

1.	Where is the biggest drop-off in the funnel and does it hold steady over time? 
2.	Are product with high traffic converting better?
3.	Does conversion rate differ by day of week or time of the day?
4.	Does faster funnel journey differ behave differently than slower ones?

### **Dataset**

events.csv

### **Skills:**

**Python:** pandas, matplotlib

**SQL:** CTEs, Case, Aggregate functions


### **Findings**
**The funnel's real bottleneck is View to Add-to-Cart, not checkout.** Of 1,404,179 unique viewers, only 37,722(2.69%) add an item to their cart which is 97.31% drop-off. Of Those who do add to cart, 11,719(31.07%) go on to purchase, meaning cart-to-purchase drop-off is comparatively low which is 68.93%. 

**The highest traffic products convert at or near 0%.**  Item 187946 drew 2,911 unique viewers but only 2 added to cart and 0 purchases (0.07% view to Add to Cart rate). Items 370653, 96924, 298009. 335975, and 151444, each with more than 1000 viewers converted at exactly 0%. These are the items with 0 conversion and is a problem to be looked for issues such as  pricing , stock availability or listing quality rather than generalizing underperforming.

**Weekday visitors convert better that weekend visitors**(34% vs 26.3% cart to purchase).

**Transaction activity concentrates heavily in evening hours**(5-9pm), while late morning(8am-12pm) is the quietest period.

**Conversion happens fast, when it happens.** Median time from view to add-to-cart is nearly 4 minutes, cart to purchase is nearly 6 minutes.

### **Business Recommendations** ###
1. **Improve high-traffic, low-conversion products:** Review pricing, product descriptions, images, reviews, and availability for products that receive many views but few add-to-cart actions.
2. **Use targeted recommendations:** Show related products or alternatives who view the product but do not add to cart.
2. **Send personalized ads** to bring them back to the product page and encourage conversion.
3. **A/B test low conversion product** to identify changes that better appeal to users and increase add-to-cart.

I believe this recommendations will best address the funnel's biggest drop-off, improve conversion and increase revenue.










