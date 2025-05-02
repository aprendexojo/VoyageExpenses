#tag MobileContainer
Begin MobileContainer TripContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 7
   Height          =   290
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   320
   Begin Station Station1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   Station1, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Station1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Station1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Station1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   290
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
      Begin MobileButton AddButton
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   AddButton, 8, , 0, False, +1.00, 4, 1, 30, , True
         AutoLayout      =   AddButton, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
         AutoLayout      =   AddButton, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
         AutoLayout      =   AddButton, 3, TripLabel, 4, False, +1.00, 4, 1, 30, , True
         Caption         =   "#kAddTrip"
         CaptionColor    =   &c007AFF00
         ControlCount    =   0
         Enabled         =   True
         Height          =   30
         Left            =   20
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "Station1"
         Scope           =   0
         TextFont        =   ""
         TextSize        =   20
         TintColor       =   &c000000
         Top             =   175
         Visible         =   True
         Width           =   280
         _ClosingFired   =   False
      End
   End
   Begin MobileButton CloseButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   CloseButton, 4, <Parent>, 4, False, +1.00, 4, 1, -*kStdGapCtlToViewV, , True
      AutoLayout      =   CloseButton, 8, , 0, False, +1.00, 4, 1, 30, , True
      AutoLayout      =   CloseButton, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   CloseButton, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   CloseButton, 3, <Parent>, 4, False, +1.00, 4, 1, -40, , True
      Caption         =   "#kCloseTrip"
      CaptionColor    =   &cBB1C1F00
      ControlCount    =   0
      Enabled         =   True
      Height          =   20
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TextFont        =   ""
      TextSize        =   20
      TintColor       =   &c000000
      Top             =   250
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
   Begin MobileLabel TripLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   1
      AutoLayout      =   TripLabel, 8, , 0, False, +1.00, 4, 1, 45, , True
      AutoLayout      =   TripLabel, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TripLabel, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   TripLabel, 3, <Parent>, 3, False, +1.00, 4, 1, 100, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   45
      Left            =   0
      LineBreakMode   =   5
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   0
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "#kNoTripAvailable"
      TextColor       =   &c000000
      TextFont        =   ""
      TextSize        =   40
      TintColor       =   &c000000
      Top             =   100
      Visible         =   True
      Width           =   320
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Method, Flags = &h0
		Function Currentlatitude() As Double
		  Return station1.GetLatitude
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(trip As Pair)
		  TripValue = trip
		  
		  if TripValue = nil then
		    TripLabel.Text = kNoTripAvailable
		    AddButton.Caption = kAddTrip
		    AddButton.CaptionFont = font.SystemFont(20)
		    CloseButton.Visible = False
		  else
		    TripLabel.Text = TripValue.Right.StringValue
		    AddButton.Caption = &u02295
		    AddButton.CaptionFont = font.SystemFont(40)
		    CloseButton.Visible = true
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateWithLatitude(latitude As Double)
		  station1.UpdateWithLatitude( latitude )
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AddTrip()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CloseTrip(tripID As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event NewExpense(tripID As Integer)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected TripValue As pair
	#tag EndProperty


	#tag Constant, Name = kAddTrip, Type = String, Dynamic = True, Default = \"Add Trip", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"Add Trip"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"Add Trip"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nuevo Viaje"
		#Tag Instance, Platform = Any, Language = fr, Definition  = \"Nouveau Voyage"
	#tag EndConstant

	#tag Constant, Name = kNewExpense, Type = String, Dynamic = True, Default = \"New Expense", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"New Expense"
		#Tag Instance, Platform = Any, Language = en, Definition  = \"New Expense"
		#Tag Instance, Platform = Any, Language = es, Definition  = \"Nuevo Gasto"
	#tag EndConstant


#tag EndWindowCode

#tag Events AddButton
	#tag Event
		Sub Pressed()
		  Select case me.Caption
		  case kAddTrip
		    RaiseEvent AddTrip
		  case &u02295
		    RaiseEvent newExpense( TripValue.Left )
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseButton
	#tag Event
		Sub Opening()
		  me.CaptionColor = new ColorGroup(&cbb1c1f, color.Yellow)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed()
		  
		  RaiseEvent CloseTrip( TripValue.Left )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TripLabel
	#tag Event
		Sub Opening()
		  me.TextFont = new font("AvenirNextCondensed-Heavy", 40)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group=""
		InitialValue="320"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group=""
		InitialValue="480"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
