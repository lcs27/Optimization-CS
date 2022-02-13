# TD1: Convex optimization
This solution is proposed by Chensheng Luo.

## Contents:
### Test code:
- test_POCS.m: which allow us to test the required functionalities in question 6,7,8; this code is given by the professor

### Main functions:
- projhyperslab.m: the projection of (u,v) on a space C={|u-v|<=delta};
- projCv.m: the projection of the picture on vertical required space Cv1 or Cv2;
- projCh.m: the projection of the picture on horizental required space Ch1 or Ch2;
- projCd.m: the projection of the picture on diagonal required space Cd1 or Cd2;
- POCS.m: the final POCS algo, with lambda=1
- Dykstra.m: another improved algo named Dykstra

## Final results:
POCS: ||y-PC(y)|| = 0.539394
Dykstra: ||y-PC(y)|| = 0.506625