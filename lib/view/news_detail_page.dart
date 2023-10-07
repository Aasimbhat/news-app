// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsDetailScreen extends StatefulWidget {
 final String newsImage,newsTitle,newsDate,author,description,content,source;
   NewsDetailScreen({
    Key? key,
    required this.newsImage,
    required this.newsTitle,
    required this.newsDate,
   required this. author,
    required this.description,
    required this.content,
    required this.source,
  }) : super(key: key);

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  final format = DateFormat('MMMM dd,yyyy');
  @override
  Widget build(BuildContext context) {
      final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    DateTime dateTime=DateTime.parse(widget.newsDate);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFFBBEC),
                Color(0xFFA9C9FF),
              ],
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter
            ),
          ),
        ),
      
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
               gradient: LinearGradient(
              colors: [
                Color(0xFFFFBBEC),
                Color(0xFFA9C9FF),
              ],
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter
            ),
            ),
            height: height*.45,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
              child: CachedNetworkImage(
                imageUrl: widget.newsImage,
                fit: BoxFit.cover,
                placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
                
              ),
            ),
          ),
          Container(
            height: height*.6,
            margin: EdgeInsets.only(top: height*.4),
            padding: EdgeInsets.only(top: 20,right: 20,left: 20),
            decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                 gradient: LinearGradient(
                colors: [
                  Color(0xFFFFBBEC),
                  Color(0xFFA9C9FF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              ),
            ),
            child: ListView(
              children: [
                Text(widget.newsTitle,style: GoogleFonts.poppins(fontSize: 20,color:Colors.black,fontWeight: FontWeight.w700),),
                SizedBox(height: height*.02,),
                Row(
                  children: [
                    Expanded(child: Text(widget.source,style: GoogleFonts.poppins(fontSize: 13,color:Colors.black,fontWeight: FontWeight.w600),)),
                    Text(format.format(dateTime),style: GoogleFonts.poppins(fontSize: 12,color:Colors.black,fontWeight: FontWeight.w500),),


                  ],
                ),
                                SizedBox(height: height*.02,),
                    Text(widget.description,style: GoogleFonts.poppins(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w500),),

              ],
            ),
          )
        ],

      ),
    );
  }
}