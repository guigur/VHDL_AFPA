----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:00 09/29/2021 
-- Design Name: 
-- Module Name:    BIN_TO_BCD - Behavioral 
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


entity BIN_TO_BCD is
	port( 
			BIN : in  STD_LOGIC_VECTOR(11 downto 0);
			BCD : out  STD_LOGIC_VECTOR(15 downto 0)
		);
end BIN_TO_BCD;

 architecture Behavioral of BIN_TO_BCD is
	component ADD3 is
		port(
				data_in	: in	STD_LOGIC_VECTOR(3 downto 0);
				data_out	: out	STD_LOGIC_VECTOR(3 downto 0)
		);
	end component;
	
	SIGNAL out_1 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_2 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_3 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_4 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_5 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_6 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_7 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_8 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_9 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_10 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_11 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_12 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_13 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_14 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_15 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_16 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_17 : STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL out_18 : STD_LOGIC_VECTOR(3 downto 0);
begin
	--BCD(15 downto 4) <= x"000";
	
	add3_1: ADD3
			port map(data_in=>'0' & BIN(11 downto 9), data_out=>out_1);
			
	add3_2: ADD3
			port map(data_in=>out_1(2 downto 0) & BIN(8), data_out=>out_2);
			
	add3_3: ADD3
			port map(data_in=>out_2(2 downto 0) & BIN(7), data_out=>out_3);
			
	add3_4: ADD3
			port map(data_in=>'0' & out_1(3) & out_2(3) & out_3(3), data_out=>out_4);

	add3_5: ADD3
			port map(data_in=>out_3(2 downto 0) & BIN(6), data_out=>out_5);

	add3_6: ADD3
			port map(data_in=>out_4(2 downto 0) & out_5(3), data_out=>out_6);
			
	add3_7: ADD3
			port map(data_in=>out_5(2 downto 0) & BIN(5), data_out=>out_7);

	add3_8: ADD3
			port map(data_in=>out_6(2 downto 0) & out_7(3), data_out=>out_8);

	add3_9: ADD3
			port map(data_in=>out_7(2 downto 0) & BIN(4), data_out=>out_9);
			
	add3_10: ADD3
			port map(data_in=>'0' & out_4(3) & out_6(3) & out_8(3), data_out=>out_10);

	add3_11: ADD3
			port map(data_in=>out_8(2 downto 0) & out_9(3), data_out=>out_11);

	add3_12: ADD3
			port map(data_in=>out_9(2 downto 0) & BIN(3), data_out=>out_12);

	add3_13: ADD3
			port map(data_in=>out_10(2 downto 0) & out_11(3), data_out=>out_13);

	add3_14: ADD3
			port map(data_in=>out_11(2 downto 0) & out_12(3), data_out=>out_14);

	add3_15: ADD3
			port map(data_in=>out_12(2 downto 0) & BIN(2), data_out=>out_15);

	add3_16: ADD3
			port map(data_in=>out_13(2 downto 0) & out_14(3), data_out=>out_16);

	add3_17: ADD3
			port map(data_in=>out_14(2 downto 0) & out_15(3), data_out=>out_17);			
	
	add3_18: ADD3
			port map(data_in=>out_15(2 downto 0) & BIN(1), data_out=>out_18);
			
	BCD<= '0' & out_10(3) & out_13(3) & out_16 & out_17 & out_18 & BIN(0);
	
	
	
end Behavioral;

