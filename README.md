# Abstract 
This research paper contains computer codes for different problems and explains how each of the problems can be solved using basic mathematical explanations as well as it covers the **histogram equalization** and how it affects the original image, the implementation of **high-boost filtering** using the equation of the high-boost and the represented mask for it, the implementation of **Laplacian for image sharpening** using a different mask and how to **enhance the image using the median filtering technique**. The tool used in this paper is MATLAB desktop version “MATLAB R2022b”.      

# Implementation and algorithm 
Explanation of each case with mathematical calculation step by step with an example of each algorithm. 
## Histogram Equalization
Take the input image and find the histogram by using the probability of each pixel in the image:
**Original image**
| 0 | 2 | 4 | 7 |
|---|---|---|---|
| 5 | 3 | 6 | 4 | 
| 1 | 7 | 5 | 7 |
| 7 | 2 | 5 | 4 |

**Probability**
| p(0) | 0.0625|
|---|---|
|  p(1) | 0.0625 | 
|  p(2) | 0.125|
|  p(3)| 0.0625 |
|  p(4) | 0.1875 |
|  p(5)| 0.1875 |
|  p(6)| 0.0625 |
|  p(7)| 0.25 |

Draw the histogram of the image by taking the number of the pixel as Y-axis and the probability as X- the axis:

![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/80a17701-4fc0-4429-9e36-ab3fab9a055f)

Swap the pixels based on the cumulative probability mass function:

| s0 | 0.4375|0 |
|---|---| --- |
|  s1| 0.875 | 1 |
|  s2 | 1.75| 2 |
|  s3| 2.1875 | 3 |
|  s4 | 3.5 | 4 |
|  s5| 4.8125 |5 |
|  s6| 5.25 |6 |
|  s7| 7 | 7 |

Apply the New values of pixels to the new image:

**Equalized image**
| 0 | 2 | 4 | 7 |
|---|---|---|---|
| 5 | 2 | 5 | 4 | 
| 1 | 7 | 5 | 7 |
| 7 | 2 | 5 | 4 |

Get the probability of the Equalized image to draw the histogram-equalized:

![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/67b9a8f4-ac4f-4061-81fd-b2a0c2a69dd0)

**Probability**
| p(0) | 0.0625|
|---|---|
|  p(1) | 0.0625 | 
|  p(2) | 0.125|
|  p(3)| 0 |
|  p(4) | 0.1875 |
|  p(5)| 0.25 |
|  p(6)| 0 |
|  p(7)| 0.25 |

## Output image
![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/99093a10-90af-42c4-a29f-63ddee6cfe9b)


## High-Boost Filtering

        g(x,y)=f(x,y)+k*[f(x,y)-f ̅(x,y)]
Apply the blur using the mask:
**Input Image f(x,y)**
|0	|2|	4|	7|	1|
|---|---|---|---|---|
|5|	3|	6|	4	|3|
|1|7|	5|	7	|5|
|7|	2|	5	|4	|6|
|2	|1	|0|	6|	9|

**Mask**
|0.11|	0.11|	0.11|
|---|---|---|
|0.11	|0.11|	0.11|
|0.11	|0.11|	0.11|

**Blurred Image f ̅(x,y)**
|1|	2|	3|	3|	1|
|---|---|---|---|---|
|2	|4	|4	|4|	3|
|3	|4	|4	|5|	3|
|2	|3	|4	|4|	4|
|1	|1	|2	|3|	2|

Subtract The Input Image from the blurred Image:

**Result Image [f(x,y)-f ̅(x,y)]**
|0|	0|	1|	4|	0|
|---|---|---|---|---|
|3|	0|	2|	0|	0|
|0|	3|	1|	2|	2|
|5|	0|	1|	0|	2|
|1|	0|	0|	3|	7|

Multiple the Result Image with K constant; where K = 2:

**Result Image kx[f(x,y)-f ̅(x,y)]**
|0|	0|	2|	8|	0|
|---|---|---|---|---|
|6|	0|	4|	0|	0|
|0|	6|	2|	4|	4|
|10|	0|	2|	0|	4|
|2|	0|	0|	6|	14|

Add the Result Image to the Input Image:

**Output Image g(x,y)**
|0|	2|	6|	17|	1|
|---|---|---|---|---|
|11|	3|	10|	4|	3|
|1|	13|	7|	11|	9|
|17|	2|	7|	4|	10|
|4|	1|	0|	12|	23|

## Output image
![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/f46fd3bb-5c54-4b3e-a7e1-e373983b7a1a)

## Laplacian for image sharpening

        g(x,y)=f(x,y)-[∇^2 f(x,y)]

**Take the Input Image and make convolution with mask:**
|0	|2|	4|	7|	1|
|---|---|---|---|---|
|5|	3|	6|	4	|3|
|1|7|	5|	7	|5|
|7|	2|	5	|4	|6|
|2	|1	|0|	6|	9|

**Mask**

|1	|1	|1|
|---|---|---|
|1	|-8	|1|
|1	|1	|1|

The result from [∇^2 f(x,y)]:

**[∇^2 f(x,y)]**

|10|	2|	-10|	-38|	6|
|---|---|---|---|---|
|-27|	6|	-9|	6|	0|
|16|	-22|	-2|	-18|	-16|
|-43|	12|	-8|	11|	-17|
|-6	|8|	18|	-24|	-56|

Take the resulting image and subtract it from the input image to get a sharper image:
**g(x,y)**

|-10|	0|	14	|45|	-5|
|---|---|---|---|---|
|32|	-3|	15	|-2|	3|
|-15|	29|	7	|25|	21|
|50|	-10|	13|	-7|	23|
|8|	-7	|-18	|30|	65|

## Output image
![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/c0a05b0f-dce9-47e6-b7d5-61ecfb88e748)


## Median filtering technique
**Take the Input Image and make convolution with mask:**
|0	|2|	4|	7|	1|
|---|---|---|---|---|
|5|	3|	6|	4	|3|
|1|7|	5|	7	|5|
|7|	2|	5	|4	|6|
|2	|1	|0|	6|	9|

**Mask**

|	|	||
|---|---|---|
|	|*||
|	|	||

By using a median filter, it reduces the noise for the image: 
**Output Image**

|2|	3|	4|	4|	3|
|---|---|---|---|---|
|2|	4|	5|	5|	4|
|5|	5|	5|	5|	5|
|2|	2|	5|	5|	6|
|2|	2|	2|	6|	6|

## Output image
![image](https://github.com/yousefturin/Image-Processing-2/assets/94796673/132ca927-7130-48a6-8c75-206fb072723f)


