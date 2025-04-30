#tag MobileScreen
Begin MobileScreen Categories
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 7
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   ScaleFactor     =   0.0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   ""
   Top             =   0
   Begin CategoryTable Table1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowRefresh    =   False
      AllowSearch     =   False
      AutoLayout      =   Table1, 4, BottomLayoutGuide, 3, False, +1.00, 4, 1, -*kStdControlGapV, , True
      AutoLayout      =   Table1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Table1, 3, Canvas1, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      currentEditedRowID=   -1
      currentEditedRowValue=   ""
      EditingEnabled  =   False
      Enabled         =   True
      EstimatedRowHeight=   -1
      Format          =   0
      Height          =   604
      Left            =   0
      LockedInPosition=   False
      RowSize         =   0
      Scope           =   0
      SectionCount    =   0
      TintColor       =   &c000000
      Top             =   200
      Visible         =   True
      Width           =   375
      _ClosingFired   =   False
      _OpeningCompleted=   False
   End
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   Canvas1, 8, , 0, False, +1.00, 4, 1, 200, , True
      AutoLayout      =   Canvas1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   Canvas1, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
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
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  var bt as new MobileToolbarButton(MobileToolbarButton.Types.Add)
		  me.RightNavigationToolbar.AddButton bt
		  
		  me.TabIcon = Picture.SystemImage("tag", 24)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarButtonPressed(button As MobileToolbarButton)
		  if button.Type = MobileToolbarButton.Types.add then
		    iOSAlert.textInput(self, "New Category", "Type the name of the new Category", AddressOf table1.addcategory, "Cancel", "Ok")
		  end if
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events Table1
	#tag Event
		Sub AccessoryPressed(section As Integer, row As Integer)
		  me.EditCategory(section, row, self)
		End Sub
	#tag EndEvent
	#tag Event
		Sub RowActionSelected(section As Integer, row As Integer, actionTag As Variant)
		  Var selectedCell As MobileTableCellData = Me.RowCellData(section, row)
		  var cellcontrol as CategoryCell = CategoryCell( selectedCell.Control )
		  me.deleteCategory( cellcontrol.categoryID.ToString )
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(section As Integer, row As Integer)
		  me.EditCategory(section, row, self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics)
		  g.Transparency = 70
		  g.DrawPicture TagImage, 0, 0, g.Width, g.Height, 0, 0, TagImage.Width, TagImage.Height
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
