
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�	
Rule violation (%s) %s - %s
20*drc2
PLCK-122default:default2'
Clock Placer Checks2default:default2�
�Poor placement for routing between an IO pin and BUFG. 
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	pclk_IBUF_inst (IBUF.O) is locked to F13
	pclk_IBUF_BUFG_inst (BUFG.I) is provisionally placed by clockplacer on BUFGCTRL_X0Y0
2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 1 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 13e1a52ed
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:59 ; elapsed = 00:00:49 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
B
-Phase 2.1 Create Timer | Checksum: 13e1a52ed
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:59 ; elapsed = 00:00:49 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 13e1a52ed
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:59 ; elapsed = 00:00:49 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 13e1a52ed
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:59 ; elapsed = 00:00:49 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.4 Update Timing | Checksum: 11df5268f
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:06 ; elapsed = 00:00:55 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=3.538  | TNS=0.000  | WHS=-0.147 | THS=-4.120 |
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 1998e0829
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:06 ; elapsed = 00:00:56 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
B
-Phase 3 Initial Routing | Checksum: 98cdd023
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:10 ; elapsed = 00:00:58 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 4.1.1 Update Timing | Checksum: ec36a1aa
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=2.376  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 17f234882
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
u

Phase %s%s
101*constraints2
4.2 2default:default2&
Global Iteration 12default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.2.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
D
/Phase 4.2.1 Update Timing | Checksum: f71ebbcd
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=2.365  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
G
2Phase 4.2 Global Iteration 1 | Checksum: f71ebbcd
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
E
0Phase 4 Rip-up And Reroute | Checksum: f71ebbcd
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 15a32e20e
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=2.365  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 15a32e20e
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 15a32e20e
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 15a32e20e
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:12 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 18bc4493a
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=2.365  | TNS=0.000  | WHS=0.104  | THS=0.000  |
2default:defaultZ35-416h px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 113383247
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 113383247
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
A
,Phase 7 Route finalize | Checksum: d3d11f72
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
H
3Phase 8 Verifying routed nets | Checksum: d3d11f72
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:00:59 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 12068384f
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:01:00 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=2.365  | TNS=0.000  | WHS=0.104  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 12068384f
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:01:00 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2o
[Time (s): cpu = 00:01:13 ; elapsed = 00:01:00 . Memory (MB): peak = 1265.523 ; gain = 0.0002default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
592default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:142default:default2
00:01:002default:default2
1265.5232default:default2
0.0002default:defaultZ17-268h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:022default:default2 
00:00:00.5092default:default2
1265.5232default:default2
0.0002default:defaultZ17-268h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2x
0F:/vivado/top/top.runs/impl_1/top_drc_routed.rpt0F:/vivado/top/top.runs/impl_1/top_drc_routed.rpt2default:default8Z2-168h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


End Record