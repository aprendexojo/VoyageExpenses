#tag Class
Protected Class ExpensesDataSource
Implements iOSMobileTableDataSource,iOSMobileTableDataSourceEditing
	#tag Method, Flags = &h0
		Function AllowRowEditing(table As iOSMobileTable, section As Integer, row As Integer) As Boolean
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  reloadExpenses(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetExpenseForRow(row as integer) As Dictionary
		  var d as Dictionary
		  
		  if row <= data.LastIndex then
		    d = data(row)
		  end if
		  
		  Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGrandTotal() As Double
		  var grandTotal as Double
		  var v as Double
		  for each d as Dictionary in data
		    v = Double.FromString(d.Lookup(expensesdb.kAmount, 0).StringValue, Locale.Current)
		    grandTotal = grandTotal + v
		  next
		  
		  Return grandTotal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadExpenses(tripID As Integer)
		  if tripID <> -1 then
		    data = app.expensesDatabase.getExpensesForTrip( tripID )
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveData()
		  Redim data(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowCount(table As iOSMobileTable, section As Integer) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  Return data.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table As iOSMobileTable, section As Integer, row As Integer) As MobileTableCellData
		  // Part of the iOSMobileTableDataSource interface.
		  
		  // Part of the iOSMobileTableDataSource interface.
		  var cell as mobileTableCellData
		  
		  cell = table.CreateCustomCell ( GetTypeInfo(ExpenseCell) )
		  
		  var cellControl as ExpenseCell = ExpenseCell( cell.Control )
		  
		  if row <= data.LastIndex then
		    var d as Dictionary = data(row)
		    var amount as String
		    if app.CurrencySymbol = "$" then
		      amount = "$ " + d.Lookup(Expensesdb.kAmount, "")
		    else
		      amount = d.Lookup(Expensesdb.kAmount, "") + " " + app.CurrencySymbol
		    end if
		    
		    cellControl.AmountLabel.Text = amount
		    cellControl.DateLabel.Text = d.Lookup(expensesdb.kDate,"")
		    cellControl.DescriptionLabel.Text = d.Lookup(Expensesdb.kDescription, "")
		    cellControl.CategoryLabel.Text = d.Lookup(expensesdb.kCategory, "")
		  end if
		  
		  Return cell
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RowEditingCompleted(table As iOSMobileTable, section As Integer, row As Integer, action As iOSMobileTable.RowEditingStyles)
		  // Part of the iOSMobileTableDataSourceEditing interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table As iOSMobileTable) As Integer
		  // Part of the iOSMobileTableDataSource interface.
		  
		  return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table As iOSMobileTable, section As Integer) As String
		  // Part of the iOSMobileTableDataSource interface.
		  
		  return ""
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected data() As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
	#tag EndViewBehavior
End Class
#tag EndClass
