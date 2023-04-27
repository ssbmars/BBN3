
//general routines

.org 0x08011444 :: GetChipDataAddr:

.org 0x08011510 :: ChipManifest:


//patch.asm

.org 0x08010E22 :: HPspeed:

.org 0x08047182 :: LibraryAntiCheat1:

.org 0x08033FA4 :: LibraryAntiCheat2:

.org 0x08001762 :: LibraryAntiCheat3:

.org 0x08007EBE :: LibraryAntiCheat4:

.org 0x080B0A38 :: tfpWindow:

.org 0x080B4E38	:: MegaWhiteFlashVal:

.org 0x080B4E3C :: MegaFlashVal:

.org 0x080AD10A	:: BossWhiteFlashVal:

.org 0x080AD10E :: BossFlashVal:

.org 0x080AE660 :: BossFlinchHook:

.org 0x0800EB66 :: CustomSizeCheckHook:

.org 0x0800DAAC :: CursorRightHook:
.org 0x0800DB20 :: CursorDownHook:
.org 0x0800DB4A :: CursorUpHook:

.org 0x080F9F00 :: TimeFreezeFadeTime:

.org 0x0800E4DA :: ADDClearHand:

.org 0x080B4E42 :: NewArmorCheckHook:

.org 0x0800147A :: OldArmorCheckSkipR14Push:

.org 0x0803C9D4 :: Cust1Hook:

.org 0x0803C9E8 :: Cust2Hook:

.org 0x080AFA56 :: ObjectBreakHook:
.org 0x080AFB1A :: ObjectBreakHook2:
.org 0x080DA2D6 :: ObjectBreakHook3:


.org 0x080B4C68 :: GuardButtonDefineCheck:

.org 0x080B4802 :: GuardButtonComboCheck:

.org 0x080D6C76 :: PanelStealHook:

.org 0x080DD764 :: MetaGelStealHook:

.org 0x080B0B76 :: BigPushCheckHook:

.org 0x080F9F8E :: grabRevengeResetBoardHook:

.org 0x080B54D4 :: ApplyStunHook:

.org 0x080b54E0 :: RemoveStunHook:

.org 0x080B5506 :: RemoveVineStun:

.org 0x080B5750 :: SetAttackActionStateHook:

.org 0x080B5748 :: SetIdleActionStateHook:

.org 0x080B04F4 :: SuperArmorNCPCheckHook:

.org 0x0803CABE :: BatteryNCPRoutineHook:
.org 0x0803CAA6 :: OilBodyNCPRoutineHook:
.org 0x0803CAB2 :: FishNCPRoutineHook:
.org 0x0803CACA :: JungleNCPRoutineHook:

.org 0x0803784A :: ToggleStyleHook:

.org 0x08047374 :: CustomValStyleCheckHook:

.org 0x08047360 :: MegaFolderValStyleCheckHook:

.org 0x080B59F4 :: ShieldHealPercentVal:

.org 0x080354FC :: ChipLimitValHook:

.org 0x08035520 :: SetStandardChipLimitVal:

.org 0x080FA6C0 :: ShadowInvulnTimeVal:

.org 0x080F8F00 :: MoleInvulnTimeVal:

.org 0x080F8EE4 :: MoleInvulnTimeHook:

.org 0x080FA6A0 :: ShadowInvulnTimeHook:

.org 0x080FA768 :: SetGaugeRoutineHook:

.org 0x08006B70 :: IncrementTurnCountHook:

.org 0x080FC5B2 :: FolderBackRoutineHook:

.org 0x0800FF28 :: PlayerTrapIndicatorHook:

.org 0x0800FF52 :: OpponentTrapIndicatorHook:

.org 0x080B59C2 :: TrapResetHook:

.org 0x080AD992 :: BarrierRemovalHook:

.org 0x080ADA44 :: AuraTimeoutLogic:

.org 0x0823714A :: CollisionCheckWindHook:

.org 0x080B0A72 :: TFPCoolDownHook:

.org 0x080B0A5C :: TFPActiveTimeHook:

.org 0x0802B412 :: CapcomScreenWaitTime:







//attack_edits.asm


.org 0x080AF16C :: HitboxTableHook:

.org 0x080DD627 :: GrabRevengeHitboxPointer:

.org 0x080D7520 :: TornadoHitboxPointer:

.org 0x080E137E :: AirStormTornadoHitboxPointer:

.org 0x080D5E07 :: AirShotHitboxPointer:

.org 0x080D9225 :: FanPullHitboxPointer:

.org 0x08237170 :: ApplyBigPushHook:

.org 0x082389E8 :: HeatChrgSL:

.org 0x080B3666 :: IceWaveEL:
.org 0x080B3682 :: IceWaveCL:

.org 0x080B168A :: SpreaderEL:
.org 0x080B169E :: SpreaderCL:

.org 0x080B177C :: BombThrowCL:

.org 0x080B30BC	:: FishySL:
.org 0x080B329E	:: FishyCL:

.org 0x080B30BD	:: CondorSL:

.org 0x080B2DF8 :: BoomerCL:

.org 0x080B2CC8 :: RockArmCL:

.org 0x080B411E :: LavaCannonSL:

.org 0x080B3740 :: BlackBombCL:

.org 0x080B344E :: BurnerSF1:
.org 0x080B34A0 :: BurnerSF2:
.org 0x080B3500 :: BurnerSF3:
.org 0x080B3546 :: BurnerCL:

.org 0x080B1B30 :: ShockWaveCL:

.org 0x080B3E18 :: AirStormV1SL:
.org 0x080B3E19 :: AirStormV2SL:
.org 0x080B3E1A :: AirStormV3SL:
.org 0x080B3E26 :: AirStormPullDelay:
.org 0x080B3E70 :: AirStormPause:
.org 0x080B3EA2 :: AirStormAtkDelay:
.org 0x080B3EE0 :: AirStormCL:

.org 0x080B2DA4 :: RattonV1CL:
.org 0x080B2DA5 :: RattonV2CL:
.org 0x080B2DA6 :: RattonV3CL:

.org 0x080B4346 :: ArrowCL:

.org 0x080B42BC :: ShakeCL:

.org 0x080B274C :: GutsPunchIW:

.org 0x080B4090 :: WaveCL:

.org 0x080B3A6E :: SpiceCL:

.org 0x080B35F4 :: GeyserCL:

.org 0x080E547A :: PawnEL:

.org 0x080E7616 :: ShakeMoveVal:

.org 0x080DF19E :: Team1AtkDelay:
.org 0x082C8244 :: Team1KF1:
.org 0x082C8258 :: Team1KF2:
.org 0x082C826C :: Team1KF3:
.org 0x082C8280 :: Team1KF4:
.org 0x082C8294 :: Team1KF5:
.org 0x082C82A8 :: Team1KF6:

.org 0x080D66EB :: ElecSwordFlinch:
.org 0x080D66E8 :: ElecSwordStun:

.org 0x080E16BC :: NeedlerFinch:

.org 0x080DF1AE :: Team1Flinch:

.org 0x080E754C :: ShakeFlinch:

.org 0x080DD60C :: GrabBanishFlinch:

.org 0x080D6703 :: AirSwordFlinch:

.org 0x080B2964 :: GutsPunchFlinch:
.org 0x080B296C :: GutsImpactFlinch:

.org 0x080E52AE :: PawnHP:
.org 0x080E52BE :: RookHP:

.org 0x080FBA28 :: RandomMeteorHP:
.org 0x080FBA29 :: HoleMeteorHP:
.org 0x080FBA2A :: ShotMeteorHP:

.org 0x080E176E :: NeedlerV1HP:
.org 0x080E1772 :: NeedlerV2HP:
.org 0x080E1776 :: NeedlerV3HP:

.org 0x080E8F66 :: Team1HP:

.org 0x080DC470 :: PoisonMaskHP:

.org 0x080b01fc :: PoltergeistAtk:

.org 0x08010604 :: MuramasAtk1:
.org 0x0801060C :: MuramasAtk2:

.org 0x080C7FC4 :: MagnumElem:

.org 0x080DC1A4 :: GuardianElem:

.org 0x080E77D4 :: SensorElem:

.org 0x080E24AC :: RopeStunTime:

.org 0x08238B50 :: RopeSL1:
.org 0x08238B64 :: RopeSL2:
.org 0x08238B8C :: RopeEL1:
.org 0x08238BA0 :: RopeEL2:
.org 0x08238BB4 :: RopeEL3:
.org 0x080B3FF8 :: RopeCL:

.org 0x080C8028 :: MagnumV1Spd:
.org 0x080C8029 :: MagnumV2Spd:
.org 0x080C802A :: MagnumV3Spd:
.org 0x082D1074 :: MagnumAnim:

.org 0x080BE4D6 :: MetalManIW:

.org 0x080AF370 :: LavaPanelAtk:

.org 0x080FDCBC :: BalanceHPMath:

.org 0x080E7B34 :: ShakeDmgAddr:

.org 0x08130E6A :: FVRedist1:
.org 0x08130E6E :: FVRedist2:
.org 0x081312C2 :: FVBranch:
.org 0x08131330 :: FVAtkPlusVal:
.org 0x0802200E :: ContinueFromSaveHook:

.org 0x080CBD88 :: LoadFVLogic:

.org 0x0800D764 :: Mettaur1Dmg:
.org 0x0800D765 :: Mettaur2Dmg:
.org 0x0800D766 :: Mettaur3Dmg:
.org 0x0800D767 :: Mettaur4Dmg:

.org 0x0800D768 :: Bunny1Dmg:
.org 0x0800D769 :: Bunny2Dmg:
.org 0x0800D76A :: Bunny3Dmg:
.org 0x0800D76B :: Bunny4Dmg:

.org 0x0800D76C :: Swordy1Dmg:
.org 0x0800D76D :: Swordy2Dmg:
.org 0x0800D76E :: Swordy3Dmg:
.org 0x0800D76F :: Swordy4Dmg:

.org 0x0800D770 :: Spikey1Dmg:
.org 0x0800D771 :: Spikey2Dmg:
.org 0x0800D772 :: Spikey3Dmg:
.org 0x0800D773 :: Spikey4Dmg:

.org 0x0800D774 :: Mushy1Dmg:
.org 0x0800D775 :: Mushy2Dmg:
.org 0x0800D776 :: Mushy3Dmg:
.org 0x0800D777 :: Mushy4Dmg:

.org 0x0800D778 :: JellyAquaDmg:
.org 0x0800D779 :: JellyFireDmg:
.org 0x0800D77A :: JellyWoodDmg:
.org 0x0800D77B :: JellyOmegaDmg:

.org 0x0800D77C :: KllrEye1Dmg:
.org 0x0800D77D :: KllrEye2Dmg:
.org 0x0800D77E :: KllrEye3Dmg:
.org 0x0800D77F :: KllrEye4Dmg:

.org 0x0800D780 :: Momogra1Dmg:
.org 0x0800D781 :: Momogra2Dmg:
.org 0x0800D782 :: Momogra3Dmg:
.org 0x0800D783 :: Momogra4Dmg:

.org 0x0800D784 :: ScuttleBeamDmg:
.org 0x0800D785 :: ScuttleFireDmg:
.org 0x0800D786 :: ScuttleIceDmg:
.org 0x0800D787 :: ScuttleElecDmg:
.org 0x0800D788 :: ScuttleVineDmg:
.org 0x0800D789 :: ScuttleOmegaDmg:


.org 0x080CC50E :: KllrEyeElem:
.org 0x080CC640 :: KllrEyeStartSpd:
.org 0x080CC686 :: KllrEyeCycleSpd:
.org 0x080CC8C8 :: KllrEyeCursorSpd:


.org 0x080D0216 :: ScuttleCycleSpd:
.org 0x080D01D0 :: ScuttleStartSpd:


.org 0x0801061A :: CustSwordAtkLogic1:
.org 0x08010632 :: CustSwordAtkLogic2:
.org 0x0801063C :: CustSwordAtkLogic3:

.org 0x080D6DC2 :: MeteorFlinch:

.org 0x080AF376 :: LavaPanelFlinch:

.org 0x080D5DFE :: GutsMachGunFlinch:
.org 0x080D5E12 :: GutsMachGunFinalFlinch:

.org 0x080D616C :: BombThrowFlinch:

.org 0x0800F8B4 :: GaiaBoostLogic:
.org 0x0800F8FC :: GaiaEraseChip:
.org 0x0800F908 :: GaiaDontErase:

.org 0x080D9946 :: BeastManInputCheck:

.org 0x080B5A70 :: BusterChargeSpeeds:






//NCP_edits.asm




.org 0x0803B746 :: HubBatchBugCheck:
.org 0x0803CC8C :: HubBatchArmor:
.org 0x0803C6AC :: HubBatchHPRoutine:
.org 0x0803CCB8 :: HubCustom:
.org 0x0803CCC0 :: HubReplacedSpace1:
.org 0x0803CC92 :: HubReplacedSpace2:
.org 0x0803C6BC :: HubHPHook:





.org 0x080B512E :: AntiDmgQueueHook:

.org 0x080B5102 :: AntiDmgChipBarrierCheckHook:

.org 0x080B52AA :: AntiDmgNCPBarrierCheckHook:

.org 0x080B52E8 :: AntiMagicRestoreTrapHook:










//pvp_qol.asm

.org 0x0800FD82 :: ChipDisplayFixHook:



.org 0x8047368 :: EquipStoryNCPsHook:


.org 0x8004680 :: OpenModeHook:
