----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:04:16 09/15/2021 
-- Design Name: 
-- Module Name:    MUX_1_TO_4 - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TWO_BITS_COUNTER is
		port (
				E, CLK	: in std_logic;
				S			: inout std_logic_vector(1 downto 0)
		);
end TWO_BITS_COUNTER;

architecture Behavioral of TWO_BITS_COUNTER is
	--SIGNAL COUNT: std_logic_vector RANGE "00" TO "11" := "00"; 
BEGIN
		PRO_TWO_BITS_COUNTER : process(CLK)
		BEGIN
				IF (rising_edge(CLK)) THEN
						IF (E = '1') THEN
								S <= S + 1;
						end if;
				end if;
		end process PRO_TWO_BITS_COUNTER;
	--S <= COUNT;
end Behavioral;

