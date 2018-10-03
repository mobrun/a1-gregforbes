CEE 224X | Released: 180925 | Due: 181002
Name:

#### Q1: What are the “Combined” fields referring to? How do you think this information may affect our analyses?

If a zip code contains “a minimum of 100 Residential customers; a minimum of 15 Non-Residential customers, with no single Non-Residential customer accounting for more than 15% of the total consumption,” it is then combined with that of another zip code. 

Within the dataset, when there is a ‘Y’ for the ‘Combined’ column (I believe) it means that there’s another zip code (or group of zip codes) associated with that zip code being presented.

When analyzing this data, this may overrepresent one zip code (the one that is combined), whereas another zip code may not be represented at all.

This matches my understanding of the combined field and how it affects our analyses.

#### Q2: Why are the “Average” fields likely not useful for our analyses?

This average value is monthly. We cannot combine an average value for one month with another. In the first place, we don’t have information regarding the total customers involved in the process.

What we want is to compute an average based on the total energy consumption across a year, and because we don’t have the proper information regarding all customers involved (and whether they use electricity, gas, or both), the average monthly energy consumption values are worthless.

True. In my response I focused on the discrepancy between comparing electricity and gas as different measures of energy.  The overlap between gas and electricity customers is very important as well.

#### Q3: What type of calculations should "X" and "Y" be in the step above? Why?

N/A



#### Q4: What is the total KBTU combined electricity and gas consumption in PG&E territory in 2017? What is the average annual electricity consumption per customer, and average annual gas consumption per customer?

The total annual electricity consumption per customer is 1.06 * 1011 kBtu (electricity) + 1.83 * 1011 kBtu (Gas Consumption) = 2.89 *1011 kBtu (in total). The average electricity consumption is 1.06 * 1011 kBtu (electricity) / 57,773,738 (people) = 1,838 kBtu (electricity) / person. The average gas consumption is 1.83 * 1011 kBtu (gas consumption) / 52,940,106 (people) = 3,456 kBtu (gas consumption) / person.

We have different values for the average annual electricity and gas consumption per customer.  I think this is because you divided total average electricity or gas by the sum of all the customers over 12 months, whereas I took the average of the customers per month.  I think in the method you use the result is counting a single customer multiple times.

#### Q5: How would you explain the results of this chart to an average property owner in Northern California? What would be the value of conducting further "seasonal" analyses of energy use, compared to "year-long" analyses, and how would you define seasonal boundaries?

I would state that in Northern California that gas consumption is high during the winter and low during the summer. As shown in months 1 – 3 and 11 – 12, the energy consumption is higher than that of the middle months. 

The opposite seems to be the case for electricity, but it is not as amplified. For months 6 – 9, the energy consumption is much higher than that of the months on either end of the spectrum.

Based on this analysis, my hypothesis is that electricity tends to be more expensive from months 1 – 3 and 11 – 12. From months 6 – 9, gas seems to be more expensive.

The value in conducting further seasonal analysis is in the disaggregation. Disaggregating the results can provide more insight.

Based on the trends, we see that gas is used more in the beginning and end of the year, whereas electricity is used more in the middle of the year. I would define seasonal boundaries based on either trends in the weather (if the information is available) or clustering of based on similarities in energy consumption. For example, I may cluster the months into the following seasons, based on the energy consumption:

•	Winter – 1, 2, 12
•	Spring – 3, 4, 5
•	Summer – 6, 7, 8
•	Fall – 9, 10, 11

I didn't really see the change in electricity use by month as that significant.  In response to your hypothesis, I would attribute the increase in gas for months 1-3 and 11-12 to the use of heating due to the drop in temperature.  I didn't think to try to define seasonal boundaries based on trends in energy consumption that's really interesting and a good idea.


#### Q6: Explain your choice of formula for "avgkbtu".

My formula included the following equation:

avgkbtu = (Total Residential Electricity + Total Residential Gas) / (max⁡( sum(elect.cust. / yr.) , sum(gas.cust./yr.) ) /12)

I added the total energy consumption of electricity and gas, over the course of the year. This was the numerator in my equation.

Subsequently, I summed the amount of customers per month, over the year. This was performed by summing the electricity customers and gas customers over the year, then taking the maximum of the two to best represent the population. I divided this value by twelve, because these same customers will be ordering across every month. This was the denominator in my equation.

Your choice for determining the number of customers assumes either all gas or all electricity customers also use either gas or electricity.  That said I don't think that is an unreasonable assumption to make.  My attempt to resolve the issue of unitentionally double counting customers was to average the averages.

#### Q7 Paste a publicly viewable link to your Slides.

https://drive.google.com/drive/u/0/folders/1TUzsdyZXl_QwA4-1VKd4-9WX-4-jANm3



#### Q8 In what ways do the results in or in the vicinity of your chosen zip code validate or contradict your expectations?

I’m surprised that the energy consumption of Palo Alto is low compared to other zip codes. I would think with the wealth and the university that there would be a very high consumption.

However, I am not surprised that the per capita energy consumption is high. An individual in Palo Alto owns great wealth (e.g. car, home, phones) that requires great energy consumption and an individual can probably pay for the proper maintenance.

I attributed the high energy consumption per capita to Stanford, although I think income is probably also related to energy use.  I didn't even think about the fact that if you use an electric car your electricity use is going to be higher.

#### Q9 Any other reactions to completing Pass One? What was especially challenging or surprising in the workflow? How might you expand on this analysis if you had more time?

Luckily, I was experienced with excel, so using a pivot table did not take me long. I found this process to be a fun review. However, when choosing which values to put into the filter, columns, and rows, this could be confusing. 

Figuring out how to create the proper “average” formulation took me a good amount of time. I did not consider that the number of residents using gas could also be close in number to the amount of residents using electricity. This was what was challenging.

Using ArcMap was clear to me, but it did take me some time. The directions were clear to me. I found it more helpful than the tutorials offered through Branner Library.

If I were to expand on this analysis, I would try to emphasize further the analysis of the ArcMap results. I heard one person saying that they felt like they were going through the motions. Additionally, it did take a lot of work to eventually analyze one zip code.




#### Q10 How would you compare the experienced or apparent work involved, as well as the usefulness of the outcome, of Pass One vs. Pass Two? How would you rate the difficulty of this assignment?

As long as one understands how to write the script, Pass Two took less work than Pass One. Additionally, using R made the process fun. The outputs were clean in R and less clean through a manual process.

Regarding the usefulness of both passes, the usefulness of Pass Two seems to be more useful than Pass One. The outcome looks more neat and subject to less estimation, however there was not that big of a difference according to my opinion.

The assignment was not difficult (5 / 10), but it was long (8 / 10).




#### Q11 In total, how long did Assignment 1 take?

Part 1: Tech Setup: 240 minutes

Part 2: Pre-Assessment: 15 minutes

Part 3: Readings: 40 minutes

Part 4: Practice Data Dive: Pass 1: 360 minutes

Part 4: Practice Data Dive: Pass 2: 90 minutes
