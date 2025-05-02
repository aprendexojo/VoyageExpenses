#tag Class
Protected Class PlaceTable
Inherits iOSMobileTable
	#tag Event
		Function ApplyActionsForRow(section As Integer, row As Integer) As iOSMobileTableRowAction()
		  Var Actions(0) As iOSMobileTableRowAction
		  Const kFlagTag As String = "Delete"
		  
		  // Create the Delete button
		  Actions(0) = New iOSMobileTableRowAction(iOSMobileTableRowAction.Styles.Destructive, kDelete, kFlagTag)
		  
		  Return Actions
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  RaiseEvent Opening
		  
		  data = new PlacesDataSource( me.RowSize)
		  me.DataSource = data
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPlace(value() As string)
		  if value.LastIndex <> -1 then
		    var newValue as String = value(0).Trim
		    if newValue <> "" then
		      app.expensesDatabase.addPlace(newValue)
		      data.reloadPlaces
		      me.ReloadDataSource
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeletePlace(row as Integer)
		  Var selectedCell As MobileTableCellData = Me.RowCellData(row)
		  var cellcontrol as PlaceCell = PlaceCell( selectedCell.Control )
		  
		  app.expensesDatabase.deletePlaceWithID( cellcontrol.PlaceID )
		  data.reloadPlaces
		  me.ReloadDataSource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditPlace(section as integer, row as integer, screen as MobileScreen)
		  if AllowEditing then
		    Var selectedCell As MobileTableCellData = Me.RowCellData(section, row)
		    var cellcontrol as PlaceCell = PlaceCell( selectedCell.Control )
		    
		    
		    me.currentEditedRowID = cellcontrol.PlaceID
		    me.currentEditedRowValue = cellcontrol.PlaceNameField.Text
		    
		    iOSAlert.textInput(screen, kPlace, kChangeThePlaceName, AddressOf me.UpdatePlace, kCancel, "Ok", cellcontrol.PlaceNameField.Text)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePlace(value() As String)
		  if value.LastIndex <> -1 then
		    var newValue as String = value(0).Trim
		    if newValue <> currentEditedRowValue and currentEditedRowID <> -1 then
		      app.expensesDatabase.updatePlace(value(0), currentEditedRowID)
		      currentEditedRowValue = ""
		      currentEditedRowID = -1
		      data.ReloadPlaces
		      me.ReloadDataSource
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook


	#tag Property, Flags = &h0
		AllowEditing As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		currentEditedRowID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		currentEditedRowValue As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data As PlacesDataSource
	#tag EndProperty

	#tag Property, Flags = &h0
		RowSize As PlaceTable.RowType = PlaceTable.RowType.Regular
	#tag EndProperty


	#tag Enum, Name = RowType, Type = Integer, Flags = &h0
		Regular
		Small
	#tag EndEnum


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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="320"
			Type="Integer"
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="320"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ClosingFired"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="TintColor"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityHint"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EditingEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EstimatedRowHeight"
			Visible=true
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="iOSMobileTable.Formats"
			EditorType="Enum"
			#tag EnumValues
				"0 - Plain"
				"1 - Grouped"
				"2 - InsetGrouped"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="SectionCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowRefresh"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowSearch"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_OpeningCompleted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowEditing"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentEditedRowID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentEditedRowValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RowSize"
			Visible=true
			Group="Behavior"
			InitialValue="PlaceTable.RowType.Regular"
			Type="PlaceTable.RowType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Regular"
				"1 - Small"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="UI Control"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
