
# PWM Generator with variable duty cycle using FPGA
Pulse Width Modulation (PWM) is a very popular modulation technique which is mainly used to control the power delivered to electrical devices such as motors and controling brightness of LEDs.
### Pin Description:
#### Inputs:
- clkin - Input clock siganl of 50MHz
- reset - To reset the duty cycle to 0%
- inc - To increase the duty cycle by 1% 
- inc1 - To increase the duty cycle by 10%
- dec - To decrease the duty cycle by 1%
- dec1 - To decrease the duty cycle by 10%
#### Outputs:
- clk - Output siganl

### Device and Tool
- Device: Altera DE1 Board (Cyclone II EP2C20F484C7)
- Tools: Quartus ii 13.0sp1

