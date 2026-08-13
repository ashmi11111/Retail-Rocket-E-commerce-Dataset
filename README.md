# E-Commerce Funnel Analysis: Identifying Drop-Offs and Revenue Oppurtunities

Overview
This project analyzes user behavior on an e-commerce platform to understand where and why customers drop off between browsing and purchasing. Using the RetailRocket dataset — ~2.7M anonymized user events spanning 4.5 months — I reconstruct the view → add-tocart → purchase funnel, segment it to find where conversion breaks down, and translate the findings into concrete recommendations.

Business Question
E-commerce platforms lose the vast majority of potential revenue not at the point of sale, but in the steps leading up to it — a customer views a product, maybe adds it to their cart, and then leaves without buying. Every one of those drop-offs represents lost revenue and a signal about what's not working in the shopping experience.

Primary question: Where in the customer journey — from product view to purchase — are we losing the most potential revenue, and what visitor or product characteristics predict whether someone converts?
This breaks down into three sub-questions the analysis is designed to answer:
1.	Where is the biggest drop-off? Is the primary leak between viewing and adding to cart (a discovery/interest problem), or between cart and purchase (a friction/trust/pricing problem)? These point to very different fixes.
2.	Who converts, and who doesn't? Do repeat visitors convert meaningfully better than first-time visitors? Does conversion vary sharply by product category, suggesting category-specific issues rather than a platform-wide one?
3.	Does timing matter? Do visitors who move quickly through the funnel (view → cart → purchase) behave differently than those who linger — and can time-to-convert be used as an early signal of purchase intent?
Why it matters: Answering these questions turns a raw event log into a prioritized action list — telling a product or marketing team where to focus limited resources (e.g., checkout redesign vs. better product recommendations vs. retargeting slow converters) rather than treating the whole funnel as equally broken.

Dataset
events.csv
item_properties_part1.csv / part2.csv
category_tree.csv

