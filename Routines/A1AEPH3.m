A1AEPH3	; RMO,MJK/ALBANY ;6/29/07  10:57
	;;2.3;Patch Module;;Oct 17, 2007;Build 8
	;;Version 2.2;PROBLEM/PATCH REPORTING;;11/23/92;Build 2
DIP	;
	S %DT="",X="T" D ^%DT S DT=Y
	D PKG^A1AEUTL G Q^A1AEPH2:'$D(A1AEPK) D VER^A1AEUTL G Q^A1AEPH2:'$D(A1AEVR)
	S A1AERD("A")="Select Sort: ",A1AERD(1)="Designation^sort by patch designation",A1AERD(2)="Category^sort by category of patch",A1AERD(3)="Priority^sort by patch priority" S:'$D(A1AES) A1AERD(4)="Status^sort by status of patch"
	S A1AERD("B")=1 W ! D SET^A1AERD K A1AERD S A1AEHD=A1AEHD_" (By "_X_")",X=$E(X,1) G Q^A1AEPH2:X="^"
	S A1AEIX=$S(X="D":"AB",1:"A"_X)
	S PGM="START^A1AEPH3",VAR="A1AEVR^A1AEIX^A1AEPKIF^A1AEHD" W ! D ZIS^A1AEUTL1 G Q^A1AEPH2:POP
START	U IO G Q^A1AEPH2:'$D(^DIC(9.4,A1AEPKIF,0)) S A1AEAB=$P(^(0),"^",2),^UTILITY($J,1)="D HD^A1AEPH2",DIWF="B4X",(A1AEOUT,A1AEJ)="" K ^UTILITY($J,"W") ;SO DI*22*152
	G DESG:A1AEIX="AB" F A1AEVR=A1AEVR,999 F A1AEI=0:0 S A1AEJ=$O(^A1AE(11005,A1AEIX,A1AEPKIF,A1AEVR,A1AEJ)) Q:A1AEJ=""!(A1AEOUT["^")  F A1AEN=0:0 S A1AEN=$O(^A1AE(11005,A1AEIX,A1AEPKIF,A1AEVR,A1AEJ,A1AEN)) Q:'A1AEN!(A1AEOUT["^")  D PRT
	G Q^A1AEPH2
	;
PRT	F A1AED0=0:0 S A1AED0=$O(^A1AE(11005,A1AEIX,A1AEPKIF,A1AEVR,A1AEJ,A1AEN,A1AED0)) Q:'A1AED0!(A1AEOUT["^")  S D0=A1AED0 D PRT1
	Q
	;
PRT1	I $D(^A1AE(11005,D0,0)) X DIS(0) I $T K DXS D HD^A1AEPH2,^A1AEP K DN,DXS,^UTILITY($J,"W")
	Q
DESG	F A1AEVR=A1AEVR,999 S (A1AED,A1AED(0))=A1AEAB_"*"_A1AEVR_"*" F A1AEI=0:0 S A1AED=$O(^A1AE(11005,"AB",A1AED)) Q:A1AED=""!(A1AEOUT["^")!(A1AED(0)'=$E(A1AED,1,$L(A1AED(0))))  S D0=+$O(^(A1AED,0)) D PRT1
	G Q^A1AEPH2
