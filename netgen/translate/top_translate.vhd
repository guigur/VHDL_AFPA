--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: top_translate.vhd
-- /___/   /\     Timestamp: Tue Sep 14 13:21:10 2021
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm top -w -dir netgen/translate -ofmt vhdl -sim top.ngd top_translate.vhd 
-- Device	: 6slx16csg324-3
-- Input file	: top.ngd
-- Output file	: /home/stetd/first-test/netgen/translate/top_translate.vhd
-- # of Entities	: 1
-- Design Name	: top
-- Xilinx	: /home/Xilinx/14.7/ISE_DS/ISE/
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

entity top is
  port (
    sw : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    seg : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    an : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end top;

architecture Structure of top is
  signal sw_7_IBUF_0 : STD_LOGIC; 
  signal sw_6_IBUF_1 : STD_LOGIC; 
  signal sw_5_IBUF_2 : STD_LOGIC; 
  signal sw_4_IBUF_3 : STD_LOGIC; 
  signal sw_3_IBUF_4 : STD_LOGIC; 
  signal sw_2_IBUF_5 : STD_LOGIC; 
  signal sw_1_IBUF_6 : STD_LOGIC; 
  signal sw_0_IBUF_7 : STD_LOGIC; 
  signal seg_1_OBUF_8 : STD_LOGIC; 
  signal an_1_OBUF_9 : STD_LOGIC; 
  signal an_0_OBUF_10 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
begin
  XST_VCC : X_ONE
    port map (
      O => an_1_OBUF_9
    );
  XST_GND : X_ZERO
    port map (
      O => an_0_OBUF_10
    );
  Q_n0008_SW0 : X_LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      ADR0 => sw_2_IBUF_5,
      ADR1 => sw_1_IBUF_6,
      ADR2 => sw_0_IBUF_7,
      O => N2
    );
  Q_n0008 : X_LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      ADR0 => sw_7_IBUF_0,
      ADR1 => sw_6_IBUF_1,
      ADR2 => sw_5_IBUF_2,
      ADR3 => sw_4_IBUF_3,
      ADR4 => sw_3_IBUF_4,
      ADR5 => N2,
      O => seg_1_OBUF_8
    );
  sw_7_IBUF : X_BUF
    port map (
      I => sw(7),
      O => sw_7_IBUF_0
    );
  sw_6_IBUF : X_BUF
    port map (
      I => sw(6),
      O => sw_6_IBUF_1
    );
  sw_5_IBUF : X_BUF
    port map (
      I => sw(5),
      O => sw_5_IBUF_2
    );
  sw_4_IBUF : X_BUF
    port map (
      I => sw(4),
      O => sw_4_IBUF_3
    );
  sw_3_IBUF : X_BUF
    port map (
      I => sw(3),
      O => sw_3_IBUF_4
    );
  sw_2_IBUF : X_BUF
    port map (
      I => sw(2),
      O => sw_2_IBUF_5
    );
  sw_1_IBUF : X_BUF
    port map (
      I => sw(1),
      O => sw_1_IBUF_6
    );
  sw_0_IBUF : X_BUF
    port map (
      I => sw(0),
      O => sw_0_IBUF_7
    );
  seg_7_OBUF : X_OBUF
    port map (
      I => an_0_OBUF_10,
      O => seg(7)
    );
  seg_6_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => seg(6)
    );
  seg_5_OBUF : X_OBUF
    port map (
      I => seg_1_OBUF_8,
      O => seg(5)
    );
  seg_4_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => seg(4)
    );
  seg_3_OBUF : X_OBUF
    port map (
      I => seg_1_OBUF_8,
      O => seg(3)
    );
  seg_2_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => seg(2)
    );
  seg_1_OBUF : X_OBUF
    port map (
      I => seg_1_OBUF_8,
      O => seg(1)
    );
  seg_0_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => seg(0)
    );
  an_3_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => an(3)
    );
  an_2_OBUF : X_OBUF
    port map (
      I => an_0_OBUF_10,
      O => an(2)
    );
  an_1_OBUF : X_OBUF
    port map (
      I => an_1_OBUF_9,
      O => an(1)
    );
  an_0_OBUF : X_OBUF
    port map (
      I => an_0_OBUF_10,
      O => an(0)
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

