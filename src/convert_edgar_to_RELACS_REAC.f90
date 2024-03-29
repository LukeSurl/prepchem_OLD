!###############################################################################!
!  CCATT-BRAMS/MCGA-CPTEC/WRF emission model    CPTEC/INPE                      !
!  Version 1.0.0: 12/nov/2010                                                   !
!  Coded by Saulo Freitas and Karla Longo                                       !
!  Contact: gmai@cptec.inpe.br - http://meioambiente.cptec.inpe.br              !
!###############################################################################!

subroutine convert_edgar_to_relacs_reac(isp,iespc,ident,spc_name_dummy)  !kml
!use chem1_list 
!use chem1_list, only : alke, bio,ora2,aro,ket,alka,ald


use emiss_vars_emissions
use edgar_emissions, only:   edgar_nspecies=>nspecies&
                            ,edgar_spc_name=>spc_name&
			    ,edgar_g                 &
			    ,CO                      &
			    ,NOX                     &
			    ,CO2                     &
			    ,CH4                     &
			    ,SO2                     &
			    ,N2O                     &
			    ,NMVOC                   &
			    ,SO4		       


!implicit none  ! < necessario para outros esquemas 
integer, intent(in) :: isp
integer, intent(inout) :: iespc,ident
character (len=*), intent(in)  :: spc_name_dummy  !kml 

!--     EDGAR    |    RELACS

!--------------------------------------------------------------------
!--	VOC BREAKDOWN PERFIL  
!- 	(Third Assessment Report to IPCC, TAR)
!--     			Industrial	Biomass burning
!--     Species		wt%	#C atoms	wt%	#C atoms
!--     Alcohols		3.2	2.5		8.1	1.5
!--     Ethane		4.7	2		7	2
!--     Propane		5.5	3		2	3
!--     Butanes		10.9	4		0.6	4
!--     Pentanes		9.4	5		1.4	5
!--     Higher alkanes	18.2	7.5		1.3	8
!--     Ethene		5.2	2		14.6	2
!--     Propene		2.4	3		7	3
!--     Ethyne		2.2	2		6	2
!--     Other alkenes, alkynes, dienes	3.8	4.8	7.6	4.6
!--     Benzene		3	6		9.5	6
!--     Toluene		4.9	7		4.1	7
!--     Xylene		3.6	8		1.2	8
!--     Trimethylbenzene	0.7	9		-	-
!--     Other aromatics	3.1	9.6		1	8
!--     Esters		1.4	5.2		-	-
!--     Ethers		1.7	4.7		5.5	5
!--     Chlorinated HC's	0.5	2.6		-	-
!--     Formaldehyde	0.5	1		1.2	1
!--     Other aldehydes	1.6	3.7		6.1	3.7
!--     Ketones		1.9	4.6		0.8	3.6
!--     Acids			3.6	1.9		15.1	1.9
!--     Others		8.1	4.9		-	-
!--
!--	All emissions will be consedered as industrialīs 
!-----------------------------------------------------------------------------------
!--------------------------------------------------------------------
!--	VOC from TAR -> RACM -> RELACS  
!--     TAR	 			RACM			RELACS	
!--     Alcohols			HC3, HC5, HC8		ALKA
!--     Ethane				ETH			ETH		
!--     Propane				HC3			ALKA
!--     Butanes				HC3			ALKA
!--     Pentanes			HC5			ALKA
!--     Higher alkanes			HC5, HC8		ALKA
!--     Ethene				ETE			ALKE
!--     Propene				OLT			ALKE
!--     Ethyne				HC3			ALKE
!--     Other alkenes, alkynes, dienes	DIEN			ALKE
!--     Benzene				TOL			ARO			
!--     Toluene				TOL			ARO			
!--     Xylene				XYL			ARO		
!--     Trimethylbenzene		TOL?			ARO			
!--     Other aromatics						ARO			
!--     Esters				HC3, HC5		ALKA		
!--     Ethers				HC8			ALKA
!--     Chlorinated HC's		HC3			ALKA
!--     Formaldehyde			HCHO			HCHO	
!--     Other aldehydes			ALD			ALD		
!--     Ketones				KET			KET		
!--     Acids				ORA1, ORA2		ORA1, ORA2		
!--     Others	
!-----------------------------------------------------------------------------------!-- 	


!--     Emissions for RACM weighted by Agregation factor Agg (only organics)
!--     Agregation factors for RACM can be found in Stockwell et al 1997, 
!-- 	J. Geos Res. 102, 25847-25879
!--     Agregation factors for RELACS can be found in Crassier et al 2000, 
!-- 	Atmos.Environ. 34 2633-2644



!if (isp.le.chem_nspecies) then
!     spc_name_dummy(isp)    = spc_chem_name (isp)
! else
!    iv=chem_nspecies
!endif
!if(isp.gt.chem_nspecies) then
!   iv=iv+1
!   spc_name_dummy(iv)    = spc_aer_name (imode,isp)
! endif


!----------------------------------------------------------------------------

!- NOx	=>NO, NO2 (?) change MP201108: NO=NOX/2 and NO2=NOX/2 in molecules (40%
!and 60% in mass)
if(spc_name_dummy == 'NO') then
   ident = NOx
   iespc = iespc+1
   emiss_spc_name(iespc,antro)           = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.7*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif
if(spc_name_dummy == 'NO2') then
   ident = NOx
   iespc = iespc+1
   emiss_spc_name(iespc,antro)           = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.3*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif

!----------------------------------------------------------------------------

!- C2H6 =>	ETH  (Agg_RACM=1)  (Agg=1)  (wt%=4.7)
if(spc_name_dummy == 'ETH') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.047*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif


!----------------------------------------------------------------------------

!- ALKA (m=62)
!-- AggRELACS:
!--HC3 0.77
!--HC5 1.23
!--HC8 1.58
!HC3
! Alcohols (Stockwell, 1997) 96% in molecules (mean weight m=45) (95% in mass)  
!               (Agg_RACM=1.37)  (HC3)=> ALKA (wt%=3.2)
! C2H2 (m=26)	    (HC3) (Agg_RACM=0.41) => ALKA   (wt%=2.2)
! C3H8	(m=44)	    (HC3) (Agg_RACM=0.57)      => ALKA   (wt%=5.5)
! C4H10 (m=58)	    (HC3)  (Agg_RACM=1.11) 	=> ALKA     (wt%=10.9)
! Chlorinated hydocarbon (mean weight m= 150)  (Agg_RACM=1)*   (HC3)	=> ALKA   (wt%=0.5)
! Esters (Stockwell, 1997)- CnH2nO2 75%n molecules ( mean weight m=83)(69% in mass)(Agg_RACM=1)*(HC3)=> ALKA    (wt%=1.4)
! HC5
!- alcohols (Stockwell, 1997) 4% in molecules (mean weight m=60)(5% in mass)  (Agg_RACM=1.07)  (HC5)	=> ALKA
!C5H12 (m=72)  	    (HC5) (Agg_RACM=0.97)	=> ALKA  (wt%=9.4)
!C6H14 and higher  (Agg_RACM=0.97) (Stockwell, 1997) 50% in molecules 
! 	(mean weight m=86) (43% in mass)  (HC5)	=> ALKA  (wt%=18.2)
!Esters - CnH2nO2  (Agg_RACM=1)* (Stockwell, 1997) 25% in molecules (mean weight = 112) (31% in mass)(HC5)	=> ALKA
! HC8
!- C6H14 + higher alkanes (stockwell, 1997) 50% in mecules (mean weight m=114) (57% in mass)(HC8)=>ALKA
!-- (Agg_RACM=0.97) (wt%=18.2)
!   Ethers (Agg_RACM=0.97) (wt%=1.7)
!--* No data!! 


if(spc_name_dummy == 'ALKA') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)    = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1)= &
                     0.77*1.37*0.95*0.032*edgar_g(ident)%src(:,:,1) +&
                     0.77*0.41*0.022*edgar_g(ident)%src(:,:,1)      +&
                     0.77*0.57*0.055*edgar_g(ident)%src(:,:,1)      +&
                     0.77*1.11*0.109*edgar_g(ident)%src(:,:,1)      +&
                     0.77*0.005*edgar_g(ident)%src(:,:,1)           +&
                     0.77*0.69*0.014*edgar_g(ident)%src(:,:,1)      +&      
                     1.23*1.07*0.05*0.032*edgar_g(ident)%src(:,:,1) +& 
                     1.23*0.97*0.094*edgar_g(ident)%src(:,:,1)      +&
                     1.23*0.97*0.43*0.182*edgar_g(ident)%src(:,:,1) +&
                     1.23*0.31*0.014*edgar_g(ident)%src(:,:,1)+&
                     1.58*0.97*0.57*0.182*edgar_g(ident)%src(:,:,1) +&
                     1.58*0.97*0.017*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif

!----------------------------------------------------------------------------

!- ALKE (m=33)
! C2H4	(m=28) (ETE) (Agg_RACM=1)	=> ALKE (ETE, Agg=0.96) (wt%=5.2)
! C3H6 (m=42)  (propene) OLT) (Agg_RACM=1)	=> ALKE (OLT, Agg=1.04) (wt%=2.4)
!--  Other alkenes, alkynes, dienes (Agg_RACM=1)	=> ALKE (Agg=1.04) (wt%=3.8)
if(spc_name_dummy == 'ALKE') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)    = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1)=0.96*0.052*edgar_g(ident)%src(:,:,1) + &
                                1.04*0.024*edgar_g(ident)%src(:,:,1)    + &
                                1.04*0.038*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)   = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif


!----------------------------------------------------------------------------

!- ARO (m=98)
! Benzene C6H6 (m=82)  (TOL)		 (Agg_RACM=0.29)	=> ARO  (TOL, Agg=0.87) ( wt%=3)
! Toluene (C7H8) (TOL)			 (Agg_RACM=1)	=> ARO (TOL, Agg=0.87)  (wt%=4.9)	
! Xylene (C8H10 m=106)	(XYL)		 (Agg_RACM=1)	=> ARO (XYL, Agg=1.04)  (wt%=3.6)
! Trimethylbenzene (C9H12 m=120)  (XYL)	 (Agg_RACM=1) => ARO (XYL, Agg=1.04) (wt%=0.7)
! Other aromatics m=106) (XYL)		 (Agg_RACM=1)	=> ARO (XYL, Agg=1.04)  (wt%=3.1)


if(spc_name_dummy == 'ARO') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) =1.04*0.03*edgar_g(ident)%src(:,:,1)+&
                                 1.04*0.049*edgar_g(ident)%src(:,:,1) + &
                                 1.04*0.036*edgar_g(ident)%src(:,:,1) + &
                                 0.87*0.007*edgar_g(ident)%src(:,:,1) + &
                                 0.29*0.87*0.031*edgar_g(ident)%src(:,:,1) 
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif


!----------------------------------------------------------------------------

! Methanal  =>	HCHO  (Agg_RACM=1)  (Agg=1) (wt%=0.5)
if(spc_name_dummy == 'HCHO') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.005*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif

!----------------------------------------------------------------------------

! ALD = 44  (Agg_RACM=1) (Agg=1)  (wt%=1.6)
! OTHER ALKANALS (assumed mainly acetaldehyde m =44)
if(spc_name_dummy == 'ALD') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.016*edgar_g(ident)%src(:,:,1) 
   
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif

!----------------------------------------------------------------------------

! Ketones    =>	KET  (Agg_RACM=1)  (Agg=1) (no weighting) (wt%=1.9)
if(spc_name_dummy == 'KET') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.019*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif

!----------------------------------------------------------------------------

!ORA1 (m=46)  (Agg_RACM=1)  (Agg=1)  (wt%_acids=3.6)
!Acids      =>    ORA1 (formic acid ) : assumed 50% in molecules (44% in mass) of acids
if(spc_name_dummy == 'ORA1') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.44*0.036*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif


!----------------------------------------------------------------------------
! ORA2 (m=60)  (Agg_RACM=1) (Agg=1) (wt%_acids=3.6)
!Acids      =>    ORA2 (acetic acid and higher acids) : assumed 50% in
!molecules (56% in mass)  of acids

if(spc_name_dummy == 'ORA2') then
   ident = NMVOC
   iespc = iespc+1
   emiss_spc_name(iespc,antro)     = spc_name_dummy
   emiss_g(iespc)%src_antro(:,:,1) = 0.56*0.036*edgar_g(ident)%src(:,:,1)
   found_emiss_spc(iespc,antro)    = 1
   print*,'==> converted from edgar - found for ',spc_name_dummy
   return
endif


end subroutine convert_edgar_to_relacs_reac
