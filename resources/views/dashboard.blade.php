@extends('layout.main_dashboard')

@section('page_title')
    MyApp - {{ $title }}
@endsection

@section('navs')
    {!! $navs !!}
@endsection

@section('out_orderby_emp')
    <canvas id="barChart" height="120"></canvas> 
@endsection

@section('out_orderby_shipper')
    <canvas id="pieChart" height="260"></canvas>
@endsection

@section('out_orderby_country')
    <canvas id="lineChart" height="120"></canvas>     
@endsection