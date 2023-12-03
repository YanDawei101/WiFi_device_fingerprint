# WiFi_device_fingerprint
Datasets and codes for extracting nonlinear phase errors as WiFi devices fingerprints based on CSIs (Channel State Information). All data is collected at 2.4GHz OFDM wireless signal.
Please cite our paper if you find it useful:
Yan D, Yan Y, Yang P, et al. Real-Time Identification of Rogue WiFi Connections in the Wild[J]. IEEE Internet of Things Journal, 2022, 10(7): 6042-6058.

Dataset I
===
Raw CSIs of smart devices collected by Linux 802.11n CSI Tool based on IPC with Intel5300 NIC.

Devices list is as follows: 
---
|        Device      |Quantity|
|--------------------|--------|
| laptop with AR9580 |   3    |
| laptop with AR5B22 |   3    |
|   Huawei Mate 9    |   2    |
|   Huawei Watch 1   |   3    |
|     OnePlus 3      |   2    |
|   Huawei Mate 10   |   2    |
|   Samsung S7 edge  |   2    |
|      Nexus 6P      |   2    |
|    Other devices   |   11   |

Data contents
---
Dataset I contains three folders. Folder ``device_identify`` contains the data of 30 different devices; folder ``location_invariance`` contains the data of 4 devices in 10 different locations; folder ``environment_invariance`` contains the data of 4 devices in 11 different environments.

Codes:
---
Use ``dataset1_preprocessing.m`` for data analysis and phase extraction.

Dataset II
===
Raw CSIs of smart devices collected by Nexmon Channel State Information Extractor based on ASUS RT-AC86U with Bcm43466c0 chip.

Devices list is as follows: 
---
|        Device          |Quantity|Abbreviation|  CMIIT ID |
|------------------------|--------|------------|-----------|
|   XIAOMI Rice Cooker   |   2    |     DFB    | 2017DP6053|
|       XIAOMI EPS       |   3    |     CZ     | 2020DP4087|
| XIAOMI Induction Cooker|   2    |     DCL    | 2017DP7231|
|    XIAOMI Table Lamp   |   3    |     TD     | 2017DP6053|
|  XIAOMI Bedside Lamp   |   1    |     CTD    | 2017DP6053|
|  XIAOMI Microwave Oven |   2    |     WBL    | 2017DP7231|
|       Oneplus6T        |   1    |     \      |     \     |
|     Thinkpad X390      |   1    |     \      |     \     |
|  HUAWEI TC5206 router  |   1    |     AP0    |2020AP11817|
|  TP-LINK AC1750 router |   1    |     AP1    |     \     |
|     XIAOMI 4C router   |   2    |  AP2、AP3  |2018DP3307 |
|     XIAOMI 3G router   |   2    |  Ap4、AP5  |2017AP2151 |
|  Tenda AC1200 router   |   2    |  AP6、AP7  |2019AP6479 |
|    Enjoy 1200 router   |   1    |     AP8    |     \     |

Data contents
---
Dataset II contains three folders. The contents are similar to Dataset I.

Codes:
---
Use ``dataset2_preprocessing.m`` for data analysis and phase extraction.

Device_type_traffic
===
Raw network traffic packets collected by Wireshark based on ASUS RT-AC86U with Bcm43466c0 chip when smart devices are connected to WiFi networks.


Devices list is as follows: 
---
Devices list is the same as Dataset II.

Data contents
---
Device_type_traffic contains network traffic packets of 19 devices in the process of connecting to WiFi networks.

Codes
---
Use ``device_type.m`` for data analysis and traffic features extraction.

