FasdUAS 1.101.10   ��   ��    k             l     ��  ��    [ U- Fix the Arduino Serial Port in use Issue on OSX Mavericks (10.9) / tested on 10.9.3     � 	 	 � -   F i x   t h e   A r d u i n o   S e r i a l   P o r t   i n   u s e   I s s u e   o n   O S X   M a v e r i c k s   ( 1 0 . 9 )   /   t e s t e d   o n   1 0 . 9 . 3   
  
 l     ��  ��    ^ X- based on information from: https://github.com/jantje/arduino-eclipse-plugin/issues/129     �   � -   b a s e d   o n   i n f o r m a t i o n   f r o m :   h t t p s : / / g i t h u b . c o m / j a n t j e / a r d u i n o - e c l i p s e - p l u g i n / i s s u e s / 1 2 9      l      ��  ��    5.9 /var/lock : Lock files

5.9.1 Purpose

Lock files should be stored within the /var/lock directory structure.
Lock files for devices and other resources shared by multiple applications, such as the serial device lock files that were originally found in either /usr/spool/locks or /usr/spool/uucp, must now be stored in /var/lock. The naming convention which must be used is "LCK.." followed by the base name of the device. For example, to lock /dev/ttyS0 the file "LCK..ttyS0" would be created.

[footnote 35]

The format used for the contents of such lock files must be the HDB UUCP lock file format. The HDB format is to store the process identifier (PID) as a ten byte ASCII decimal number, with a trailing newline. For example, if process 1230 holds a lock file, it would contain the eleven characters: space, space, space, space, space, space, one, two, three, zero, and newline.

[35] Then, anything wishing to use /dev/ttyS0 can read the lock file and act accordingly (all locks in /var/lock should be world-readable).      �     5 . 9   / v a r / l o c k   :   L o c k   f i l e s 
 
 5 . 9 . 1   P u r p o s e 
 
 L o c k   f i l e s   s h o u l d   b e   s t o r e d   w i t h i n   t h e   / v a r / l o c k   d i r e c t o r y   s t r u c t u r e . 
 L o c k   f i l e s   f o r   d e v i c e s   a n d   o t h e r   r e s o u r c e s   s h a r e d   b y   m u l t i p l e   a p p l i c a t i o n s ,   s u c h   a s   t h e   s e r i a l   d e v i c e   l o c k   f i l e s   t h a t   w e r e   o r i g i n a l l y   f o u n d   i n   e i t h e r   / u s r / s p o o l / l o c k s   o r   / u s r / s p o o l / u u c p ,   m u s t   n o w   b e   s t o r e d   i n   / v a r / l o c k .   T h e   n a m i n g   c o n v e n t i o n   w h i c h   m u s t   b e   u s e d   i s   " L C K . . "   f o l l o w e d   b y   t h e   b a s e   n a m e   o f   t h e   d e v i c e .   F o r   e x a m p l e ,   t o   l o c k   / d e v / t t y S 0   t h e   f i l e   " L C K . . t t y S 0 "   w o u l d   b e   c r e a t e d . 
 
 [ f o o t n o t e   3 5 ] 
 
 T h e   f o r m a t   u s e d   f o r   t h e   c o n t e n t s   o f   s u c h   l o c k   f i l e s   m u s t   b e   t h e   H D B   U U C P   l o c k   f i l e   f o r m a t .   T h e   H D B   f o r m a t   i s   t o   s t o r e   t h e   p r o c e s s   i d e n t i f i e r   ( P I D )   a s   a   t e n   b y t e   A S C I I   d e c i m a l   n u m b e r ,   w i t h   a   t r a i l i n g   n e w l i n e .   F o r   e x a m p l e ,   i f   p r o c e s s   1 2 3 0   h o l d s   a   l o c k   f i l e ,   i t   w o u l d   c o n t a i n   t h e   e l e v e n   c h a r a c t e r s :   s p a c e ,   s p a c e ,   s p a c e ,   s p a c e ,   s p a c e ,   s p a c e ,   o n e ,   t w o ,   t h r e e ,   z e r o ,   a n d   n e w l i n e . 
 
 [ 3 5 ]   T h e n ,   a n y t h i n g   w i s h i n g   t o   u s e   / d e v / t t y S 0   c a n   r e a d   t h e   l o c k   f i l e   a n d   a c t   a c c o r d i n g l y   ( a l l   l o c k s   i n   / v a r / l o c k   s h o u l d   b e   w o r l d - r e a d a b l e ) .        l     ��������  ��  ��     ��  l    t ����  Q     t     k    U       l   ��������  ��  ��        I   ��   !
�� .sysodlogaskr        TEXT   m     " " � # # � F i x   A r d u i n o ' s   S e r i a l   P o r t   i s   b u s y   i s s u e     ( A d m i n   p r i v i l e g e s   n e e d e d ! ) ? ! �� $ %
�� 
btns $ l 	  	 &���� & J    	 ' '  ( ) ( m     * * � + +  Y e s ,   p l e a s e ! )  ,�� , m     - - � . .  N o ,   i ' m   f i n e .��  ��  ��   % �� / 0
�� 
disp / m   
 ��
�� stic     0 �� 1 2
�� 
dflt 1 m    ����  2 �� 3��
�� 
givu 3 m    ���� ��     4 5 4 r     6 7 6 1    ��
�� 
rslt 7 o      ���� 0 
dlogresult 
DlogResult 5  8 9 8 l   ��������  ��  ��   9  : ; : Z    S < =�� > < =     ? @ ? n     A B A 1    ��
�� 
bhit B 1    ��
�� 
rslt @ m     C C � D D  Y e s ,   p l e a s e ! = k     = E E  F G F I    )�� H I
�� .sysoexecTEXT���     TEXT H m     ! J J � K K h s u d o   m k d i r   - p   / v a r / l o c k   & &   s u d o   c h m o d   0 7 7 7   / v a r / l o c k I �� L��
�� 
badm L m   $ %��
�� boovtrue��   G  M�� M I  * =�� N O
�� .sysodlogaskr        TEXT N m   * - P P � Q Q 2 F i x   s u c c e s s f u l l y   a p p l i e d . O �� R S
�� 
btns R J   . 3 T T  U�� U m   . 1 V V � W W  T h a n k s��   S �� X��
�� 
disp X m   4 7��
�� stic   ��  ��  ��   > I  @ S�� Y Z
�� .sysodlogaskr        TEXT Y m   @ C [ [ � \ \ ^ F i x   w a s   n o t   a p p l i e d .   T r y   a g a i n ,   i f   y o u   n e e d   t o . Z �� ] ^
�� 
btns ] J   D I _ _  `�� ` m   D G a a � b b  O K��   ^ �� c��
�� 
disp c m   J M��
�� stic   ��   ;  d�� d l  T T��������  ��  ��  ��    R      �� e f
�� .ascrerr ****      � **** e o      ���� 0 errormsg errorMsg f �� g��
�� 
errn g o      ���� 0 errornum errorNum��    I  ] t�� h i
�� .sysodisAaleR        TEXT h m   ] ` j j � k k " C o u l d   n o t   f i x   i t ! i �� l m
�� 
mesS l b   c h n o n m   c f p p � q q � T r y :   s u d o   " m k d i r   / v a r / l o c k   & &   s u d o   c h o m d   0 7 7 7   / v a r / l o c k "   i n   t h e   T e r m i n a l .   o o   f g���� 0 errormsg errorMsg m �� r s
�� 
btns r m   i l t t � u u  C a n c e l s �� v��
�� 
dflt v m   m n���� ��  ��  ��  ��       �� w x��   w ��
�� .aevtoappnull  �   � **** x �� y���� z {��
�� .aevtoappnull  �   � **** y k     t | |  ����  ��  ��   z ������ 0 errormsg errorMsg�� 0 errornum errorNum { ! "�� * -�������������������� C J���� P V���� [ a���� } j�� p t����
�� 
btns
�� 
disp
�� stic    
�� 
dflt
�� 
givu�� �� 
�� .sysodlogaskr        TEXT
�� 
rslt�� 0 
dlogresult 
DlogResult
�� 
bhit
�� 
badm
�� .sysoexecTEXT���     TEXT
�� stic   �� 
�� stic   �� 0 errormsg errorMsg } ������
�� 
errn�� 0 errornum errorNum��  
�� 
mesS�� 
�� .sysodisAaleR        TEXT�� u W����lv���k��� 
O�E�O��,�  "�a el Oa �a kv�a a  
Y a �a kv�a a  
OPW X  a a a �%�a �ka   ascr  ��ޭ