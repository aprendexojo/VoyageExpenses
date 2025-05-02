#tag MobileScreen
Begin MobileScreen StatsScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   HasNavigationBar=   False
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   ScaleFactor     =   0.0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "#kStats"
   Top             =   0
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 8, , 0, False, +1.00, 4, 1, 200, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   200
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
   End
   Begin StatsTable StatsTable1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   StatsTable1, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   StatsTable1, 1, Canvas1, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatsTable1, 2, Canvas1, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   StatsTable1, 3, Canvas1, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   2
      Height          =   604
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   200
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Activated()
		  StatsTable1.reload
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  me.TabIcon = Picture.SystemImage("chart.pie", 24)
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.Transparency = 70
		  g.DrawPicture stats, 0, 0, g.Width, g.Height, 0, 0, stats.Width, stats.Height
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StatsTable1
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  Var selectedCell As MobileTableCellData = Me.RowCellData(section, row)
		  var sc as statsDetailScreen
		  var tripID as integer
		  
		  Select case section
		    
		  case 0
		    
		    tripID = BasicStatsCell( selectedCell.Control ).tag.IntegerValue
		    sc = new statsDetailScreen( tripID )
		    sc.Show(self)
		    
		  case 1
		    
		    tripID = StatCell( selectedCell.Control ).tag.IntegerValue
		    sc = new statsDetailScreen( tripID )
		    sc.Show(self)
		    
		  case 2 // these are places
		    
		    var placeName as String = BasicStatsCell( selectedCell.Control).TripLabel.Text
		    sc = new statsDetailScreen( placeName )
		    sc.Show(self)
		    
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
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
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
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
		Name="ScaleFactor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
