library ieee;
library work;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all; 
use work.myType.all;

entity magic is
    port(input : in integer;
	      clk ,reset : in std_logic;
         matrix_out : out sqr );
  constant  n :integer:=5;
end magic;


architecture magic of magic is
constant m:integer:= 5;

signal temparr :intsqr;
 begin
process( clk , reset , input)
variable i , j : integer;
variable k: integer := 1;
variable q:integer := 0 ; --counter
   begin
if reset='1' then
for o in 0 to n-1 loop
 for p in 0 to m-1 loop
 temparr(o,p)<= 0;
 end loop;
 end loop;
elsif reset='0' then
 i:=0;
 j:= n/2;
 while  (k < n*n+1) loop
 if ( clk'event and clk='1') then
 
 temparr(i,j) <= conv_integer(k);
 
k:=k+1;
 i:=i-1;
 j:=j+1;

 if (i<0 and j>n-1) then
 i:=i+2;
 j:=j-1;
 elsif (i<0) then
 i:=n-1;
  elsif (j>n-1) then
 j:=0;
  elsif (temparr(i,j) > 0) then
 i := i +2;
 j := j-1;
 end if;
 end if;
 end loop;
 end if;
 for o in 0 to n-1 loop
 for p in 0 to m-1 loop
 matrix_out(q)<=conv_std_logic_vector(temparr(o,p),m);
 q:= q+1;
 end loop;
 end loop;
 end process;
 end architecture; 
 