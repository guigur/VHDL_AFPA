----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:59 09/15/2021 
-- Design Name: 
-- Module Name:    SPEED_BUTTONS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SPEED_BUTTONS is
		PORT(
				CLK 						: in  STD_LOGIC;
				TRIG_UP, TRIG_DOWN	: in	STD_LOGIC;
				SPEED		: inout	INTEGER RANGE 0 TO 100000000
		);
end SPEED_BUTTONS;

architecture Behavioral of SPEED_BUTTONS is
begin
		PRO_SPEED_BUTTON : process (TRIG_UP, TRIG_DOWN, CLK)
		begin
				IF rising_edge(CLK) THEN--(CLK'event and CLK='1') THEN
						IF (TRIG_UP = '1') THEN
							SPEED <= SPEED + 1;
 						ELSIF (TRIG_DOWN = '1') THEN
								SPEED <= SPEED - 1;
						ELSE
								SPEED <= SPEED;
						END IF;
				END IF;
		end process PRO_SPEED_BUTTON;
end Behavioral;

