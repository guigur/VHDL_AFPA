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
				sw				: in 	std_logic_vector(7 downto 0);
				seg			: out std_logic_vector(7 downto 0); --Array of the 7 digits
				an				: out std_logic_vector(3 downto 0); --Array of the 4 anodes
				clk 			: in	std_logic;
				btnu, btnd	: in	std_logic;
				btnr			: in	std_logic;
				
				Led			: out std_logic_vector(1 downto 0);
				
				vgaRed      : out	STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
				vgaGreen    : out STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
				vgaBlue     : out STD_LOGIC_VECTOR(1 downto 0); -- 2 bits
				Hsync   		: out STD_LOGIC;
				Vsync   		: out STD_LOGIC;
				
				JD_OUT		: out STD_LOGIC_VECTOR(1 downto 0);
				JD_IN			: in 	STD_LOGIC_VECTOR(1 downto 0)
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
		COMPONENT SEG_DECODER_DEC
				PORT (
					val	: in std_logic_vector(15 downto 0);
					dis	: in std_logic_vector(1 downto 0);
					seg	: out std_logic_vector(7 downto 0); --Array of the 7 digits
					an		: out std_logic_vector(3 downto 0) --Array of the 4 anodes
				);
		END COMPONENT;
		COMPONENT VGA_DISPLAY
				Port ( RST, CLK	: in	STD_LOGIC;
						 AnimClock	: in	STD_LOGIC;
						 RED      	: out	STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
						 GREEN    	: out	STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
						 BLUE     	: out	STD_LOGIC_VECTOR(1 downto 0); -- 2 bits
						 H_SYNC   	: out	STD_LOGIC;
						 V_SYNC   	: out	STD_LOGIC
				);
		END COMPONENT;
		COMPONENT PROCESS_PMOD
				Port ( RST, CLK		: in	STD_LOGIC;
						 CE, SD			: in	STD_LOGIC; -- CE is 20 MHz -- SD choose the channel
						 D0, D1  		: in	STD_LOGIC;
						 PMOD_CLK, CS	: out STD_LOGIC;
						 DATA				: out STD_LOGIC_VECTOR(11 downto 0) -- 12 bits
				);
		END COMPONENT;
		component BIN_TO_BCD is
				port( 
						BIN : in  STD_LOGIC_VECTOR(11 downto 0);
						BCD : out  STD_LOGIC_VECTOR(15 downto 0)
					);
		end component;
--		COMPONENT D_LATCH 
--				PORT (
--						D, CLK	: in  STD_LOGIC;
--						S 			: out  STD_LOGIC
--				);
--		END COMPONENT;
--		COMPONENT T_LATCH 
--				PORT (
--						T, CLK	: in  STD_LOGIC;
--						S 		 	: out	STD_LOGIC
--				);
--		END COMPONENT;	
		COMPONENT CLOCK_DIV 
				Port ( RST, CLK	: in		STD_LOGIC;
						 SPEED		: in		INTEGER RANGE 0 TO 100000000;
						 S				: out  	STD_LOGIC
			);
		END COMPONENT;
		COMPONENT TWO_BITS_COUNTER 
				Port ( 
						E, CLK 	: in 	std_logic;
						S			: out std_logic_vector(1 downto 0)
				);
		END COMPONENT;
		COMPONENT BCD_COUNTER 
				PORT(
						CLK, INC	: IN 	STD_LOGIC;
						S			: OUT	STD_LOGIC_VECTOR(15 DOWNTO 0)
				);
		END COMPONENT;
		COMPONENT SPEED_BUTTONS is
		PORT(
				CLK 						: in  STD_LOGIC;
				TRIG_UP, TRIG_DOWN	: in	STD_LOGIC;
				SPEED		: inout	INTEGER RANGE 0 TO 100000000
		);
		END COMPONENT;
		
		SIGNAL CLK_DIV_INTERNAL : std_logic;
		SIGNAL DIGIT_COUNTER_INTERNAL : std_logic;

		SIGNAL COUNT_INTERNAL : std_logic_vector(1 downto 0);
		SIGNAL DIGITS_VAL_INTERNAL : STD_LOGIC_VECTOR(15 DOWNTO 0);
		SIGNAL PMOD_DATA : STD_LOGIC_VECTOR(11 downto 0);
		begin
		
		--Vsync <= '1';
		--Hsync <= '1';
		
			clockdiv1: CLOCK_DIV
					port map(RST=>btnr, CLK=>CLK, SPEED=>99999, S=>CLK_DIV_INTERNAL);

			tbc1: TWO_BITS_COUNTER
					port map(E=>CLK_DIV_INTERNAL, CLK=>CLK, S=>COUNT_INTERNAL);

			count_speed: CLOCK_DIV
					port map(RST=>btnr, CLK=>CLK, SPEED=>9999999, S=>DIGIT_COUNTER_INTERNAL);

			--Compteur BCD
			--bcd1: BCD_COUNTER
			--		port map(CLK=>CLK, INC=>DIGIT_COUNTER_INTERNAL, S=>DIGITS_VAL_INTERNAL);
			
			--Binaire -> BCD
			bin2bcd1: BIN_TO_BCD
					port map(BIN=>"110010001010", BCD=>DIGITS_VAL_INTERNAL);
					
			--Affichage BCD-> 7 seg
			decoder1: SEG_DECODER_DEC
					port map(val=>DIGITS_VAL_INTERNAL, dis=>COUNT_INTERNAL, seg=>seg, an=>an);
			
			vgaDisplay1: VGA_DISPLAY
					port map(RST=>btnr, CLK=>CLK, AnimClock=>DIGIT_COUNTER_INTERNAL, RED=>vgaRed, GREEN=>vgaGreen, BLUE=>vgaBlue, H_SYNC=>Hsync, V_SYNC=>Vsync);

			processAD1: PROCESS_PMOD
					port map(RST=>btnr, CLK=>CLK, CE=>CLK_DIV_INTERNAL, SD=>'0', CS=>JD_OUT(0), D0=>JD_IN(0), D1=>JD_IN(1), PMOD_CLK=>JD_OUT(1), DATA=>PMOD_DATA);

			Led <= COUNT_INTERNAL;

			--Ledtwo <= CLK_DIV_INTERNAL;

end Behavioral;




