MODULE chem1_list
  IMPLICIT NONE
  
  CHARACTER(LEN=24),PARAMETER :: chemical_mechanism='RADM_WRF_FIM'
  INTEGER,PARAMETER :: maxnspecies= 200
  INTEGER,PARAMETER :: nspecies=097!86+4+7 LSURL
  
  
  !Name of species 
  CHARACTER(LEN=8),PARAMETER,DIMENSION(nspecies) :: spc_name=(/ &
      'ASH     '& 
     ,'SO2     ' & !
     ,'SULF    ' & !!srf - changed from SULF to SO4 !changed back LSURL
     ,'BR      '&!LSURL
     ,'HBR     '&!LSURL
     ,'HOBR    '&!LSURL
     ,'BR2     '&!LSURL
     ,'BRO     '&!LSURL     
     ,'CL      '&!LSURL
     ,'HCL     '&!LSURL
     ,'HOCL    '&!LSURL
     ,'CL2     '&!LSURL
     ,'CLO     '&!LSURL
     ,'HO      ' & !
     ,'HO2     ' & !
     ,'NO      ' & !
     ,'NO2     ' & !
     ,'HNO3    ' & !
     ,'HG      ' & !LSURL
     ,'O3      ' & !
     ,'H2O2    ' & !
     ,'NO3     ' & !
     ,'N2O5    ' & !
     ,'HONO    ' & !
     ,'HNO4    ' & !
     ,'CO      ' & !
     ,'CO2     ' & !
     ,'NN      ' & !
     ,'O2      ' & !
     ,'H2O     ' & !
     ,'H2      ' & !
     ,'O3P     ' & !
     ,'O1D     ' & !
     ,'CH4     ' & !
     ,'ETH     ' & !
     ,'HC3     ' & !
     ,'HC5     ' & !
     ,'HC8     ' & !
     ,'ETE     ' & !
     ,'OLT     ' & !
     ,'OLI     ' & !
     ,'DIEN    ' & !
     ,'ISO     ' & !
     ,'API     ' & !
     ,'LIM     ' & !
     ,'TOL     ' & !
     ,'XYL     ' & !
     ,'CSL     ' & !
     ,'HCHO    ' & !
     ,'ALD     ' & !
     ,'KET     ' & !
     ,'GLY     ' & !
     ,'MGLY    ' & !
     ,'DCB     ' & !
     ,'MACR    ' & !
     ,'UDD     ' & !
     ,'HKET    ' & !
     ,'ONIT    ' & !
     ,'PAN     ' & !
     ,'TPAN    ' & !
     ,'OP1     ' & !
     ,'OP2     ' & !
     ,'PAA     ' & !
     ,'ORA1    ' & !
     ,'ORA2    ' & !
     ,'MO2     ' & !
     ,'ETHP    ' & !
     ,'HC3P    ' & !
     ,'HC5P    ' & !
     ,'HC8P    ' & !
     ,'ETEP    ' & !
     ,'OLTP    ' & !
     ,'OLIP    ' & !
     ,'ISOP    ' & !
     ,'APIP    ' & !
     ,'LIMP    ' & !
     ,'PHO     ' & !
     ,'ADDT    ' & !
     ,'ADDX    ' & !
     ,'ADDC    ' & !
     ,'TOLP    ' & !
     ,'XYLP    ' & !
     ,'CSLP    ' & !
     ,'ACO3    ' & !
     ,'TCO3    ' & !
     ,'KETP    ' & !
     ,'OLNN    ' & !
     ,'OLND    ' & !
     ,'XO2     ' & !
     ,'NH3     ' &
     ,'BBURN2  ' & !PM25
     ,'BBURN3  ' & !PM10     
     ,'OC      '&
     ,'BC      '&
     ,'DMS     '&   
     ,'URBAN2  '&
     ,'URBAN3  '&
   /)
  
  
  !Number of each specie   
  INTEGER,PARAMETER :: ASH =001

  INTEGER,PARAMETER :: SO2 =002
  INTEGER,PARAMETER :: SULF=003 

  INTEGER,PARAMETER :: BR   =004
  INTEGER,PARAMETER :: HBR  =005
  INTEGER,PARAMETER :: HOBR =006
  INTEGER,PARAMETER :: BR2  =007
  INTEGER,PARAMETER :: BRO  =008

  INTEGER,PARAMETER :: CL   =009
  INTEGER,PARAMETER :: HCL  =010
  INTEGER,PARAMETER :: HOCL =011
  INTEGER,PARAMETER :: CL2  =012
  INTEGER,PARAMETER :: CLO  =013 

  INTEGER,PARAMETER :: HO  =014
  INTEGER,PARAMETER :: HO2 =015

  INTEGER,PARAMETER :: NO  =016
  INTEGER,PARAMETER :: NO2 =017
  INTEGER,PARAMETER :: HNO3=018

  INTEGER,PARAMETER :: HG   =019

  INTEGER,PARAMETER :: O3  =020
  INTEGER,PARAMETER :: H2O2=021
  INTEGER,PARAMETER :: NO3 =022
  INTEGER,PARAMETER :: N2O5=023
  INTEGER,PARAMETER :: HONO=024
  INTEGER,PARAMETER :: HNO4=025
  INTEGER,PARAMETER :: CO  =026
  INTEGER,PARAMETER :: CO2 =027
  INTEGER,PARAMETER :: NN  =028
  INTEGER,PARAMETER :: O2  =029
  INTEGER,PARAMETER :: H2O =030
  INTEGER,PARAMETER :: H2  =031
  INTEGER,PARAMETER :: O3P =032
  INTEGER,PARAMETER :: O1D =033
  INTEGER,PARAMETER :: ETH =034
  INTEGER,PARAMETER :: HC3 =035
  INTEGER,PARAMETER :: HC5 =036
  INTEGER,PARAMETER :: HC8 =037
  INTEGER,PARAMETER :: ETE =038
  INTEGER,PARAMETER :: OLT =039
  INTEGER,PARAMETER :: OLI =040
  INTEGER,PARAMETER :: DIEN=041
  INTEGER,PARAMETER :: ISO =042
  INTEGER,PARAMETER :: API =043
  INTEGER,PARAMETER :: LIM =044
  INTEGER,PARAMETER :: TOL =045
  INTEGER,PARAMETER :: XYL =046
  INTEGER,PARAMETER :: CSL =047
  INTEGER,PARAMETER :: HCHO=048
  INTEGER,PARAMETER :: ALD =049
  INTEGER,PARAMETER :: KET =050
  INTEGER,PARAMETER :: GLY =051
  INTEGER,PARAMETER :: MGLY=052
  INTEGER,PARAMETER :: DCB =053
  INTEGER,PARAMETER :: MACR=054
  INTEGER,PARAMETER :: UDD =055
  INTEGER,PARAMETER :: HKET=056
  INTEGER,PARAMETER :: ONIT=057
  INTEGER,PARAMETER :: PAN =058
  INTEGER,PARAMETER :: TPAN=059
  INTEGER,PARAMETER :: OP1 =060
  INTEGER,PARAMETER :: OP2 =062
  INTEGER,PARAMETER :: PAA =063
  INTEGER,PARAMETER :: ORA1=064
  INTEGER,PARAMETER :: ORA2=065
  INTEGER,PARAMETER :: MO2 =066
  INTEGER,PARAMETER :: ETHP=067
  INTEGER,PARAMETER :: HC3P=068
  INTEGER,PARAMETER :: HC5P=069
  INTEGER,PARAMETER :: HC8P=070
  INTEGER,PARAMETER :: ETEP=071
  INTEGER,PARAMETER :: OLTP=072
  INTEGER,PARAMETER :: OLIP=073
  INTEGER,PARAMETER :: ISOP=074
  INTEGER,PARAMETER :: APIP=075
  INTEGER,PARAMETER :: LIMP=076
  INTEGER,PARAMETER :: PHO =077
  INTEGER,PARAMETER :: ADDT=078
  INTEGER,PARAMETER :: ADDX=079
  INTEGER,PARAMETER :: ADDC=080
  INTEGER,PARAMETER :: TOLP=081
  INTEGER,PARAMETER :: XYLP=082
  INTEGER,PARAMETER :: CSLP=083
  INTEGER,PARAMETER :: ACO3=084
  INTEGER,PARAMETER :: TCO3=085
  INTEGER,PARAMETER :: KETP=086
  INTEGER,PARAMETER :: OLNN=087
  INTEGER,PARAMETER :: OLND=088
  INTEGER,PARAMETER :: XO2 =089
  INTEGER,PARAMETER :: NH3 =090
  INTEGER,PARAMETER :: BBURN2=091  !
  INTEGER,PARAMETER :: BBURN3=092  !pm10.
  INTEGER,PARAMETER :: OC  =093
  INTEGER,PARAMETER :: BC  =094
  INTEGER,PARAMETER :: DMS =095
  INTEGER,PARAMETER :: URBAN2 =096 !pm2.5
  INTEGER,PARAMETER :: URBAN3 =097 !pm10
  

  
  INTEGER,PARAMETER :: on = 1
  INTEGER,PARAMETER :: off = 0
  
  
  INTEGER,PARAMETER :: src  = 1 ! source term 
				   
 ! spaction(specie,[1=source]) 
  INTEGER,PARAMETER,DIMENSION(1,nspecies) :: spc_alloc=RESHAPE((/ &
    1 , & ! ASH - 001
    1 , & ! SO2 - 002
    1 , & ! SULF/SO4 - 003
    1 , & ! BR   =004
    1 , & ! HBR  =005
    1 , & ! HOBR =006
    1 , & ! BR2  =007
    1 , & ! BRO  =008
    1 , & ! CL   =009
    1 , & ! HCL  =010
    1 , & ! HOCL =011
    1 , & ! CL2  =012
    1 , & ! CLO  =013
    1 , & ! HO -  014
    1 , & ! HO2 - 015
    1 , & ! NO - 016
    1 , & ! NO2 - 017
    1 , & ! HNO3 - 018
    1 , & ! HG   =019
    0 , & ! O3 - 020
    0 , & ! H2O2 - 021    
    0 , & ! NO3 - 022
    0 , & ! N2O5 - 023
    0 , & ! HONO - 024    
    0 , & ! HNO4 - 025
    1 , & ! CO -  026
    1 , & ! CO2 - 027
    0 , & ! N2 -  028
    0 , & ! O2 -  029
    0 , & ! H2O - 030
    0 , & ! H2 -  031
    0 , & ! O3P - 032
    0 , & ! O1D - 033   
    1 , & ! CH4 - 034
    1 , & ! ETH - 035
    1 , & ! HC3 - 036
    1 , & ! HC5 - 037
    1 , & ! HC8 - 038
    1 , & ! ETE - 039
    1 , & ! OLT - 040
    1 , & ! OLI - 041
    1 , & ! DIEN -042
    1 , & ! ISO - 043
    1 , & ! API - 044
    1 , & ! LIM - 045
    1 , & ! TOL - 046
    1 , & ! XYL - 047
    1 , & ! CSL - 048
    1 , & ! HCHO -049
    1 , & ! ALD - 050
    1 , & ! KET - 051
    0 , & ! GLY - 052
    0 , & ! MGLY -053
    0 , & ! DCB - 054
    1 , & ! MACR -055
    0 , & ! UDD - 056
    0 , & ! HKET -057
    0 , & ! ONIT -058
    0 , & ! PAN - 059
    0 , & ! TPAN -060
    0 , & ! OP1 - 061
    0 , & ! OP2 - 062
    0 , & ! PAA - 063
    1 , & ! ORA1 -064
    1 , & ! ORA2 -065
    0 , & ! MO2 - 066
    0 , & ! ETHP -067
    0 , & ! HC3P -068
    0 , & ! HC5P -069
    0 , & ! HC8P -070
    0 , & ! ETEP -071
    0 , & ! OLTP -072
    0 , & ! OLIP -073
    0 , & ! ISOP -074
    0 , & ! APIP -075
    0 , & ! LIMP -076
    0 , & ! PHO - 077
    0 , & ! ADDT -078
    0 , & ! ADDX -079
    0 , & ! ADDC -080
    0 , & ! TOLP -081
    0 , & ! XYLP -082
    0 , & ! CSLP -083
    0 , & ! ACO3 -084
    0 , & ! TCO3 -085
    0 , & ! KETP -086
    0 , & ! OLNN -087
    0 , & ! OLND -088
    0 , & ! XO2 - 089
    1 , & ! NH3 - 090
    1 , & ! PM25 -091
    1 , & ! PM10 -092
    1 , & ! OC -  093
    1 , & ! BC -  094
    1 , & ! DMS - 095
    1 , & ! urb2- 096
    1  & ! urb3- 097  
   /),(/1,nspecies/))
  
   REAL,PARAMETER,DIMENSION(nspecies) :: weight=(/&
    -99. ,   & ! ASH - 001 !not used
    64.  ,   & ! SO2 - 002
    98.  ,   & ! SULF - 003
    80. , & ! BR   =004
    81. , & ! HBR  =005
    97. , & ! HOBR =006
    160. , & ! BR2  =007
    96. , & ! BRO  =008
    35.5 , & ! CL   =009
    36.5 , & ! HCL  =010
    52.5 , & ! HOCL =011
    71 , & ! CL2  =012
    51.5, & ! CLO  =013
    17.  ,   & ! HO - 014
    33.  ,   & ! HO2 - 015
    30.  ,   & ! NO - 016
    46.  ,   & ! NO2 - 017
    63.  ,   & ! HNO3 - 018
    201. , & ! HG  =019
    48.  ,   & ! O3 - 020
    34.  ,   & ! H2O2 - 021
    62.  ,   & ! NO3 - 022
    108. ,   & ! N2O5 - 023
    47.  ,   & ! HONO - 024
    79.  ,   & ! HNO4 - 025
    28.  ,   & ! CO - 026
    44.  ,   & ! CO2 - 027
    28.  ,   & ! N2 - 028
    32.  ,   & ! O2 - 029
    18.  ,   & ! H2O - 030
    2.   ,   & ! H2 - 031
    16.  ,   & ! O3P - 032
    16.  ,   & ! O1D - 033
    16.  ,   & ! CH4 - 034
    30.  ,   & ! ETH - 035
    44.  ,   & ! HC3 - 036
    72.  ,   & ! HC5 - 037
    114. ,   & ! HC8 - 038
    28.  ,   & ! ETE - 039
    42.  ,   & ! OLT - 040
    68.  ,   & ! OLI - 041
    54.  ,   & ! DIEN - 042
    68.  ,   & ! ISO - 043
    136. ,   & ! API - 044
    136. ,   & ! LIM - 045
    92.  ,   & ! TOL - 046
    106. ,   & ! XYL - 047
    108. ,   & ! CSL - 048
    30.  ,   & ! HCHO - 049
    44.  ,   & ! ALD - 050
    72.  ,   & ! KET - 051
    58.  ,   & ! GLY - 052
    72.  ,   & ! MGLY - 053
    87.  ,   & ! DCB - 054
    70.  ,   & ! MACR - 055
    119. ,   & ! UDD - 056
    74.  ,   & ! HKET - 057
    119. ,   & ! ONIT - 058
    121. ,   & ! PAN - 059
    147. ,   & ! TPAN - 060
    48.  ,   & ! OP1 - 061
    62.  ,   & ! OP2 - 062
    76.  ,   & ! PAA - 063
    46.  ,   & ! ORA1 - 064
    60.  ,   & ! ORA2 - 065
    47.  ,   & ! MO2 - 066
    61.  ,   & ! ETHP - 067
    75.  ,   & ! HC3P - 068
    103. ,   & ! HC5P - 069
    145. ,   & ! HC8P - 070
    77.  ,   & ! ETEP - 071
    91.  ,   & ! OLTP - 072
    117. ,   & ! OLIP - 073
    117. ,   & ! ISOP - 074
    185. ,   & ! APIP - 075
    185. ,   & ! LIMP - 076
    107. ,   & ! PHO - 077
    109. ,   & ! ADDT - 078
    123. ,   & ! ADDX - 079
    125. ,   & ! ADDC - 080
    141. ,   & ! TOLP - 081
    155. ,   & ! XYLP - 082
    157. ,   & ! CSLP - 083
    75.  ,   & ! ACO3 - 084
    115. ,   & ! TCO3 - 085
    103. ,   & ! KETP - 086
    136. ,   & ! OLNN - 087
    136. ,   & ! OLND - 088
    44.  ,   & ! XO2 - 089
    18.02,   & ! NH3 - 090
    00.  ,   & ! PM25 - 091
    00.  ,   & ! PM10 - 092
    12.  ,   & ! BC - 093
    12.  ,   & ! OC - 094
    62.  ,   & ! DMS - 095
    00.  ,   & ! PM25 - 096
    00.     & ! PM10 - 097    
    /)
  
  
END MODULE chem1_list
