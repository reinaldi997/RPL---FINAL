@extends('layouts.app')

@section('title', 'Daftar Laporan')

@section('content')
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Daftar Laporan Sampah</h2>
    </div>

    {{-- Ringkasan jumlah per status --}}
    <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
            <div class="card text-center shadow-sm">
                <div class="card-body">
                    <div class="fs-2 fw-bold">{{ $reports->count() }}</div>
                    <div class="text-muted small">Total</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card text-center shadow-sm border-warning">
                <div class="card-body">
                    <div class="fs-2 fw-bold text-warning">{{ $reports->where('status', 'Menunggu')->count() }}</div>
                    <div class="text-muted small">Menunggu</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card text-center shadow-sm border-info">
                <div class="card-body">
                    <div class="fs-2 fw-bold text-info">{{ $reports->where('status', 'Diproses')->count() }}</div>
                    <div class="text-muted small">Diproses</div>
                </div>
            </div>
        </div>
        <div class="col-6 col-md-3">
            <div class="card text-center shadow-sm border-success">
                <div class="card-body">
                    <div class="fs-2 fw-bold text-success">{{ $reports->where('status', 'Selesai')->count() }}</div>
                    <div class="text-muted small">Selesai</div>
                </div>
            </div>
        </div>
    </div>

    {{-- Daftar kartu laporan --}}
    <div class="row g-3">
        @forelse ($reports as $report)
            @php
                $warna = match ($report->status) {
                    'Menunggu' => 'warning',
                    'Diproses' => 'info',
                    'Selesai'  => 'success',
                    default    => 'secondary',
                };
            @endphp

            <div class="col-md-6 col-lg-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-2">
                            <span class="fw-bold">{{ $report->kode_laporan }}</span>
                            <span class="badge text-bg-{{ $warna }}">{{ $report->status }}</span>
                        </div>
                        <p class="card-text">{{ $report->deskripsi }}</p>
                        <div class="text-muted small">
                            📍 {{ $report->alamat_lokasi ?? 'Lokasi belum diisi' }}<br>
                            👤 {{ $report->pelapor->nama }}<br>
                            🕒 {{ $report->created_at->format('d M Y, H:i') }}
                        </div>
                    </div>
                    <div class="card-footer bg-white d-flex justify-content-between">
                        <span class="small">👍 {{ $report->jumlah_upvote }} dukungan</span>
                    </div>
                </div>
            </div>
        @empty
            <div class="col-12">
                <div class="alert alert-secondary text-center">Belum ada laporan.</div>
            </div>
        @endforelse
    </div>
@endsection