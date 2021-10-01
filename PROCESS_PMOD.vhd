----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:34 09/22/2021 
-- Design Name: 
-- Module Name:    PROCESS_PMOD - Behavioral 
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
use ieee.std_logic_unsigned.all; --Magic library to add numbers


entity PROCESS_PMOD is
    Port ( RST, CLK	: in	STD_LOGIC;
	  CE, SD		: in	STD_LOGIC; -- CE is 20 MHz -- SD choose the channel
           D0, D1  	: in	STD_LOGIC;
	   PMOD_CLK, CS	: out 	STD_LOGIC;
	   DATA		: out 	STD_LOGIC_VECTOR(11 downto 0) -- 12 bits
    );
end PROCESS_PMOD;
-----------------------------------------

-- The clock is divided by 6 -> 100Mhz/6 = 16.66Mhz
-- One period is 60ns
-- TQuiet is min 50ns min
-- The packetPulse signal have to count to a minimum of 16 bits + Tquiet
-- packetPulse will count to 256 for a first test

-----------------------------------------
architecture Behavioral of PROCESS_PMOD is
SIGNAL PacketNumber: STD_LOGIC_VECTOR(4 downto 0); -- 5 bits to count to 15
SIGNAL DIVCounter: STD_LOGIC_VECTOR(1 downto 0); -- 3 bits to count to 5
SIGNAL PMOD_CLK_INT : STD_LOGIC;
--SIGNAL CountState : STD_LOGIC;
SIGNAL PacketPulseCounter: STD_LOGIC_VECTOR(7 downto 0);-- 
SIGNAL DATA_Shift		:  	STD_LOGIC_VECTOR(11 downto 0);
begin

	PRO_PROCESS_PMOD : process (RST, CLK)
	begin
		if (RST = '1') THEN
            		--RESET 
		elsif rising_edge(CLK) THEN
			if (PacketPulseCounter < 96) THEN
				--DATA time
				CS <= '0';
				PMOD_CLK <= PMOD_CLK_INT;
				  
			else
				CS <= '1';
				PMOD_CLK <= '1';
			end if;
			PacketPulseCounter <= PacketPulseCounter + 1;
			--CountState <= '1';
		end if;
	end process PRO_PROCESS_PMOD;
	
	PRO_DIV_CLK : process (RST, CLK)
	begin
		if rising_edge(CLK) THEN
			DIVCounter <= DIVCounter + 1;
			if (DIVCounter = "10") THEN
				DIVCounter <= "00";
				PMOD_CLK_INT <= not(PMOD_CLK_INT);
			end if;
		end if;
	end process PRO_DIV_CLK;

end Behavioral;

