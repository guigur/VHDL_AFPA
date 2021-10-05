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
	Port(	RST, CLK, CE1ms: in	STD_LOGIC;
			CE, SD			: in	STD_LOGIC; -- CE is 20 MHz -- SD choose the channel
			D0, D1  			: in	STD_LOGIC;
			PMOD_CLK, CS	: out STD_LOGIC;
			DATA				: out STD_LOGIC_VECTOR(11 downto 0) -- 12 bits
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
SIGNAL counterBit: STD_LOGIC_VECTOR(4 downto 0); -- 5 bits to count to 15
SIGNAL counter16MHz: STD_LOGIC_VECTOR(2 downto 0); -- 3 bits to count to 5

SIGNAL PMOD_CLK_INT : STD_LOGIC;
--SIGNAL CE1ms : STD_LOGIC;
--SIGNAL PacketPulseCounter: STD_LOGIC_VECTOR(7 downto 0);-- 
SIGNAL DATA_Shift		:  	STD_LOGIC_VECTOR(11 downto 0);
begin

	PRO_PROCESS_PMOD : process (RST, CLK)
	begin
		if (RST = '1') THEN
			counterBit <= "00000";
		elsif rising_edge(CLK) THEN
			if (CE1ms = '1') THEN
				counterBit <= "00000";
			elsif	(counter16MHz = "000") THEN
				if (counterBit < 16) THEN
					DATA_Shift <= DATA_Shift(10 downto 0) & D0;
					counterBit <= counterBit + 1;
				elsif (counterBit = 16) THEN
					DATA <= DATA_Shift;
					counterBit <= counterBit + 1;
				end if;
			end if;
		end if;
	end process PRO_PROCESS_PMOD;
	
	--------CE1ms <= '1' when counter16MHz = 2 else '0';
	
	CS <= '0' when counterBit < 16 else '1';
	
	PMOD_CLK <= PMOD_CLK_INT when counterBit < 16 else '1';
	
	PRO_GEN_CLK_PMOD : process (CLK)
	begin
		if falling_edge(CLK) THEN
			if (counter16MHz = "000") THEN
				PMOD_CLK_INT <= '0';
			elsif (counter16MHz = "011") THEN
				PMOD_CLK_INT <= '1';
			end if;
		end if;
	end process PRO_GEN_CLK_PMOD;
	
	PRO_16MHz_CLK : process (RST, CLK)
	begin
		if (RST = '1') THEN
			counter16MHz <= "000";
		elsif rising_edge(CLK) THEN
			if (counterBit < 17) THEN
				if (counter16MHz = "101") THEN
					counter16MHz <= "000";
				else
					counter16MHz <= counter16MHz + 1;
				end if;
			end if;
		end if;
	end process PRO_16MHz_CLK;
	
end Behavioral;

