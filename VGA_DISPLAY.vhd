----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:34:49 09/15/2021 
-- Design Name: 
-- Module Name:    CLOCK_DIV - Behavioral 
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

entity VGA_DISPLAY is
    Port ( RST, CLK	: in    STD_LOGIC;
           RED      : out  	STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
           GREEN    : out  	STD_LOGIC_VECTOR(2 downto 0); -- 3 bits
           BLUE     : out  	STD_LOGIC_VECTOR(1 downto 0); -- 2 bits
           H_SYNC   : out   STD_LOGIC;
           V_SYNC   : out   STD_LOGIC
    );
end VGA_DISPLAY;

----------------------------------------------------------------------------------

-- Pixel Clock............25.175 MHz (25 MHz used -> clk/4)
-- TMDS Clock............251.750 MHz
-- Pixel Time..........39.7 ns ±0.5%
-- Horizontal Freq........31.469 kHz
-- Line Time.................31.8 μs
-- Vertical Freq...........59.940 Hz
-- Frame Time................16.7 ms

-------- Horizontal Timings --------
-- Active Pixels.................640 ok
-- Front Porch....................16 ok
-- Sync Width.....................96 ok
-- Back Porch.....................48 ok
-- Blanking Total................160 ok
-- Total Pixel...................800 ok
-- Sync Polarity.................neg

--------- Vertical Timings ---------
-- Active Lines..................480 ok
-- Front Porch....................10 ok
-- Sync Width......................2 ok
-- Back Porch.....................33 (29 used)
-- Blanking Total.................45 (42 used)
-- Total Lines...................525 (521 used)
-- Sync Polarity.................neg

----------------------------------------------------------------------------------

architecture Behavioral of VGA_DISPLAY is
		--SIGNAL TMP	: STD_LOGIC;
		SIGNAL HorizontalCounter: INTEGER RANGE 0 TO 3200 := 0; -- 800 col total
      SIGNAL VerticalCounter: INTEGER RANGE 0 TO 521 := 0; -- 521 rows total
        --SIGNAL PixelClock: STD_LOGIC_VECTOR(1 downto 0); -- 2 bits to count to 4
		SIGNAL Vblanking: STD_LOGIC;
		SIGNAL Hblanking: STD_LOGIC;

begin
	PRO_VGA_DISPLAY : process (RST, CLK) -- Reset is an Sync signal
	begin
		if (RST = '1') THEN
            --RESET 
        elsif rising_edge(CLK) THEN--(CLK'event and CLK='1') THEN
            if (VerticalCounter < 2) THEN
                -- V Sync
                V_SYNC <= '0';
					 Vblanking <= '1';
            elsif (VerticalCounter < 31) THEN  -- 2 + 29 = 31
                -- V back porch
                V_SYNC <= '1';
					 Vblanking <= '1';
            elsif (VerticalCounter < 511) THEN  -- 480 + 31 = 511
                -- display col
                V_SYNC <= '1';
					 Vblanking <= '0';

            elsif (VerticalCounter < 521) THEN  -- 511 + 10
                -- V front porch
                V_SYNC <= '1';
					 Vblanking <= '1';
            else
                VerticalCounter <= 0;
                V_SYNC <= '1';
					 Vblanking <= '1';
            end if;

			if (HorizontalCounter < 384) THEN
				-- H sync
                H_SYNC <= '0';
					 Hblanking <= '1';
            elsif (HorizontalCounter < 576) THEN -- 192 + 384 = 576
                -- back porch
						H_SYNC <= '1';
						Hblanking <= '1';
            elsif (HorizontalCounter < 3136 and VerticalCounter < 31 and VerticalCounter > 510) THEN -- 576 + 2560 = 3136
                -- display
                H_SYNC <= '1';
					Hblanking <= '0';

            elsif (HorizontalCounter < 3200) THEN -- 64 + 3136 = 3200
				-- front porch
                H_SYNC <= '1';
					 Hblanking <= '1';
            else
                HorizontalCounter <= 0;
                VerticalCounter <= VerticalCounter + 1;
                H_SYNC <= '1';
					 Hblanking <= '1';
				end if;
            HorizontalCounter <= HorizontalCounter + 1;
				
				if (Hblanking = '0' and Hblanking = '0') THEN
				    RED <= "111";
                GREEN <= "000";
                BLUE <= "00";
				else
					 RED <= "000";
                GREEN <= "000";
                BLUE <= "00";
				end if;
				
        end if;
	end process PRO_VGA_DISPLAY;

	--S <= TMP;
end Behavioral;
