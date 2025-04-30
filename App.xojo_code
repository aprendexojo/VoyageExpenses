#tag Class
Protected Class App
Inherits MobileApplication
	#tag CompatibilityFlags = TargetIOS
	#tag Event
		Sub Activated()
		  var f as FolderItem = SpecialFolder.ApplicationSupport.Child("cachedColors")
		  if f <> nil and f.Exists then
		    var tis as TextInputStream = TextInputStream.Open(f)
		    var js as JSONItem
		    try
		      js = new JSONItem(tis.ReadAll)
		      cachedColors = js.Value("root")
		      tis.Close
		    Catch e as JSONException
		      
		    end try
		  end if
		  
		  if cachedColors = nil then
		    cachedColors = new JSONItem
		    var rnd as new Random
		    
		    var cat() as pair = me.expensesDatabase.GetCategories
		    
		    var max as integer = cat.LastIndex
		    var c as Color
		    
		    var entry as new JSONItem
		    for n as integer = 0 to max
		      c = color.RGB( rnd.InRange(0,255), rnd.InRange(0, 255), rnd.InRange(0, 255))
		      entry.Value( cat(n).Right.StringValue ) = c.ToString
		    next
		    
		    cachedColors = entry
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivating()
		  if cachedColors <> nil then
		    var f as FolderItem = SpecialFolder.ApplicationSupport.Child("cachedColors")
		    
		    var tos as TextOutputStream = TextOutputStream.Create(f)
		    
		    var js as new JSONItem
		    js.Value("root") = cachedColors
		    
		    tos.Write js.ToString
		    tos.Close
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Opening()
		  expensesDatabase = new ExpensesDB
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(exc As RuntimeException) As Boolean
		  Break
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		cachedColors As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h0
		expensesDatabase As ExpensesDB
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
		#tag ViewProperty
			Name="_LaunchOptionsHandled"
			Visible=false
			Group="Behavior"
			InitialValue="False"
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
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IconBadgeNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
