# Digital-Clock-HH.MM.SS-FPGA
Design Digital Clock ( HH.MM.SS) with VHDL / FPGA

![SECOND => MUNİTE TRANSITION](R1346451-01.jpg)

FPGA üzerinde seven segment display kullanmadan bir clock periyodunun ayarlanmasıyla saat, dakika, saniye olarak bir dijital saat tasarımı, algoritmayı anlamanızda yardımcı olacaktır. 

The algorithm primarily consists of a simple if-elsif-else structure. This structure first checks the seconds: if second < 59, it increments the seconds by 1. Otherwise, it moves to the else condition, where it resets the seconds and increments the minutes by 1. The same process applies to the hours as well. This way, a basic digital clock design is achieved, capable of counting up to 23:59:59. Below, I will also share the test bench section. When running the program in simulation, you can observe that the minutes increment successfully when the seconds reach 59, and the hours increment by 1 when the minutes reach 59. You can also find the simulation results below.

The only point to pay attention to is type conversions. Many people attempt to perform arithmetic operations or comparisons on bit arrays defined as std_logic_vector, which inevitably results in errors. To avoid this, you need to understand which types are used for specific operations. For this project, for instance, after defining the types as std_logic_vector, these types were assigned to internal signals as unsigned. The necessary comparisons and arithmetic operations were then performed, and finally, the types were converted back from unsigned to std_logic_vector.

Don’t forget to use the 'IEEE.std_logic_unsigned' library! 😊

[SECOND => MUNİTE TRANSITION ( VIVADO)]

![SECOND => MUNİTE TRANSITION](MUNITE_to_HOUR.png)

[MUNITE => HOUR TRANSITION ( VIVADO) ]

![MUNITE => HOUR TRANSITION](SECOND_to_MUNITE.png)

[SECOND => MUNITE TRANSITION (MODELSIM)]

![SECOND => MUNITE TRANSITION](modelsim_second_to_munite.png)

[MUNITE => HOUR TRANSITION (MODELSIM)]

![MUNITE => HOUR TRANSITION](modelsim_munite_to_hour.png)



If you'd like to improve yourself further, you can take this to the next level by adding milliseconds. Additionally, if you have an FPGA board, you can implement this algorithm on seven-segment displays...
