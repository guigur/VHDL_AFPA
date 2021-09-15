----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:00 09/14/2021 
-- Design Name: 
-- Module Name:    top - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP is
		port (
				sw		: in std_logic_vector(7 downto 0);
				seg	: out std_logic_vector(7 downto 0); --Array of the 7 digits
				an		: out std_logic_vector(3 downto 0); --Array of the 4 anodes
				clk 	: in std_logic;
				btnd	: in std_logic;
				Led	: out std_logic
		);
end TOP;

architecture Behavioral of TOP is
		COMPONENT SEG_DECODER 
				PORT (
					sw		: in std_logic_vector(7 downto 0);
					seg	: out std_logic_vector(7 downto 0); --Array of the 7 digits
					an		: out std_logic_vector(3 downto 0) --Array of the 4 anodes
				);
		END COMPONENT;
		COMPONENT T_LATCH 
				PORT (
					T, CLK : in  STD_LOGIC;
					S : out  STD_LOGIC
				);
		END COMPONENT;
		signal T1_INTERNAL : std_logic;
		signal T2_INTERNAL : std_logic;
		signal T3_INTERNAL : std_logic;
		signal T4_INTERNAL : std_logic;
		signal T5_INTERNAL : std_logic;
		signal T6_INTERNAL : std_logic;
		signal T7_INTERNAL : std_logic;
		signal T8_INTERNAL : std_logic;
		signal T9_INTERNAL : std_logic;
		signal T10_INTERNAL : std_logic;
		signal T11_INTERNAL : std_logic;

		begin
			decoder1: SEG_DECODER
					port map(sw, seg, an);
			dlatch1: T_LATCH
					port map(T=>btnd, clk=>clk, S=>T1_INTERNAL);
			dlatch2: T_LATCH
					port map(T=>T1_INTERNAL, clk=>clk, S=>T2_INTERNAL);
			dlatch3: T_LATCH
					port map(T=>T2_INTERNAL, clk=>clk, S=>T3_INTERNAL);
			dlatch4: T_LATCH
					port map(T=>T3_INTERNAL, clk=>clk, S=>T4_INTERNAL);	
			dlatch5: T_LATCH
					port map(T=>T4_INTERNAL, clk=>clk, S=>T5_INTERNAL);	
			dlatch6: T_LATCH
					port map(T=>T5_INTERNAL, clk=>clk, S=>T6_INTERNAL);	
			dlatch7: T_LATCH
					port map(T=>T6_INTERNAL, clk=>clk, S=>T7_INTERNAL);	
			dlatch8: T_LATCH
					port map(T=>T7_INTERNAL, clk=>clk, S=>T8_INTERNAL);	
			dlatch9: T_LATCH
					port map(T=>T8_INTERNAL, clk=>clk, S=>T9_INTERNAL);	
			dlatch10: T_LATCH
					port map(T=>T9_INTERNAL, clk=>clk, S=>T10_INTERNAL);	
			dlatch11: T_LATCH
					port map(T=>T10_INTERNAL, clk=>clk, S=>T11_INTERNAL);	
			dlatch12: T_LATCH
					port map(T=>T11_INTERNAL, clk=>clk, S=>Led);	
end Behavioral;




