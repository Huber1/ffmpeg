FROM registry.fedoraproject.org/fedora

WORKDIR /app

RUN dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
RUN dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

RUN dnf install -y --allowerasing \
    wget \
    make \
    gcc \
    g++ \
    pkg-config \
    nasm yasm \
    libchromaprint-devel \
    frei0r-devel \
    gnutls-devel \
    ladspa-devel \
    lcms2-devel \
    libaom-devel \
    aribb24-devel \
    libaribcaption-devel \
    lilv-devel \
    libass-devel \
    libbluray-devel \
    libbs2b-devel \
    libcaca-devel \
    codec2-devel \
    libdav1d-devel \
    libdc1394-devel \
    libdvdnav-devel \
    fdk-aac-devel \
    flite-devel \
    game-music-emu-devel \
    gsm-devel \
    ilbc-devel \
    libjxl-devel \
    libvpl-devel \
    libmodplug-devel \
    lame-devel \
    libmysofa-devel \
    opencore-amr-devel \
    openh264-devel \
    openjpeg-devel \
    libopenmpt-devel \
    opus-devel \
    libplacebo-devel \
    pulseaudio-libs-devel \
    qrencode-devel \
    librabbitmq-devel \
    rav1e-devel \
    librist-devel \
    librsvg2-devel \
    rubberband-devel \
    libsmbclient-devel \
    snappy-devel \
    soxr-devel \
    libssh-devel \
    speex-devel \
    srt-devel \
    svt-av1-devel \
    tesseract-devel \
    libtheora-devel \
    twolame-devel \
    libv4l-devel \
    vid.stab-devel \
    vo-amrwbenc-devel \
    libvpx-devel \
    xvidcore-devel \
    zimg-devel \
    zeromq-devel \
    zvbi-devel \
    openal-soft-devel \
    rocm-opencl-devel \
    vapoursynth-devel \
    libgcrypt-devel \
    jack-audio-connection-kit-devel \
    libcdio-devel \
    libcdio-paranoia-devel \
    libva-devel \
    libvdpau-devel \
    AMF-devel


RUN wget https://ffmpeg.org/releases/ffmpeg-7.1.1.tar.xz
RUN tar -xf ffmpeg-7.1.1.tar.xz

WORKDIR ffmpeg-7.1.1


RUN ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --datadir=/usr/share/ffmpeg \
    --docdir=/usr/share/doc/ffmpeg \
    --incdir=/usr/include/ffmpeg \
    --libdir=/usr/lib64 \
    --mandir=/usr/share/man \
    --arch=x86_64 \
    --enable-nonfree \
    --disable-htmlpages \
    --enable-pic \
    --disable-stripping \
    --enable-shared \
    --disable-static \
    --enable-gpl \
    --enable-version3 \
    --enable-libsmbclient \
    --disable-openssl \
    --enable-bzlib \
    --enable-frei0r \
    --enable-chromaprint \
    --enable-gcrypt \
    --enable-gnutls \
    --enable-ladspa \
    --enable-lcms2 \
    --enable-libshaderc \
    --enable-vulkan \
    --disable-cuda-sdk \
    --enable-libaom \
    --enable-libaribb24 \
    --enable-libaribcaption \
    --enable-libass \
    --enable-libbluray \
    --enable-libbs2b \
    --enable-libcaca \
    --enable-libcdio \
    --enable-libcodec2 \
    --enable-libdav1d \
    --enable-libdc1394 \
    --enable-libdvdnav \
    --enable-libdvdread \
    --enable-libfdk-aac \
    --enable-libflite \
    --enable-libfontconfig \
    --enable-libfreetype \
    --enable-libfribidi \
    --enable-libharfbuzz \
    --enable-libgme \
    --enable-libgsm \
    --enable-libilbc \
    --enable-libjack \
    --enable-libjxl \
    --enable-libmodplug \
    --enable-libmp3lame \
    --enable-libmysofa \
    --enable-libopenh264 \
    --enable-libopenjpeg \
    --enable-libopenmpt \
    --enable-libopus \
    --enable-libplacebo \
    --enable-libpulse \
    --enable-libqrencode \
    --enable-librabbitmq \
    --enable-librav1e \
    --enable-librist \
    --enable-librsvg \
    --enable-librubberband \
    --enable-libsnappy \
    --enable-libsvtav1 \
    --enable-libsoxr \
    --enable-libspeex \
    --enable-libssh \
    --enable-libsrt \
    --enable-libtesseract \
    --enable-libtheora \
    --enable-libtwolame \
    --enable-libvidstab \
    --enable-libvmaf \
    --enable-libvorbis \
    --enable-libv4l2 \
    --enable-libvpx \
    --enable-libwebp \
    --enable-libxml2 \
    --enable-libzimg \
    --enable-libzmq \
    --enable-libzvbi \
    --enable-lto \
    --enable-libvpl \
    --enable-lv2 \
    --enable-vaapi \
    --enable-vdpau \
    --enable-libopencore-amrnb \
    --enable-libopencore-amrwb \
    --enable-libvo-amrwbenc \
    --enable-libxvid \
    --enable-openal \
    --enable-opencl \
    --enable-opengl \
    --enable-pthreads \
    --enable-vapoursynth \
    --enable-muxers \
    --enable-demuxers \
    --enable-hwaccels \
    --disable-encoders \
    --disable-decoders \
    --disable-decoder='h264,hevc,libxevd,vc1,vvc' \
    --enable-encoder=',a64multi,a64multi5,aac,libfdk_aac,ac3,adpcm_adx,adpcm_argo,adpcm_g722,adpcm_g726,adpcm_g726le,adpcm_ima_alp,adpcm_ima_amv,adpcm_ima_apm,adpcm_ima_qt,adpcm_ima_ssi,adpcm_ima_wav,adpcm_ima_ws,adpcm_ms,adpcm_swf,adpcm_yamaha,alac,alias_pix,amv,anull,apng,ass,asv1,asv2,av1_amf,av1_nvenc,av1_qsv,av1_vaapi,bitpacked,bmp,cinepak,cljr,dca,dfpwm,dnxhd,dpx,dvbsub,dvdsub,dvvideo,exr,ffv1,ffvhuff,flac,flashsv,flashsv2,flv,g723_1,gif,h261,h263,h263_v4l2m2m,h263p,h264_amf,h264_nvenc,h264_qsv,h264_v4l2m2m,h264_vaapi,hap,hdr,hevc_amf,hevc_nvenc,hevc_qsv,hevc_v4l2m2m,hevc_vaapi,huffyuv,ilbc,jpeg2000,jpegls,libaom,libaom_av1,libcodec2,libgsm,libgsm_ms,libilbc,libjxl,libmp3lame,libopencore_amrnb,libopenh264,libopenjpeg,libopus,librav1e,libspeex,libsvtav1,libtheora,libtwolame,libvo_amrwbenc,libvorbis,libvpx_vp8,libvpx_vp9,libwebp,libwebp_anim,libxvid,mjpeg,mjpeg_qsv,mjpeg_vaapi,mlp,mp2,mp2fixed,mpeg1video,mpeg2_qsv,mpeg2_vaapi,mpeg2video,mpeg4,mpeg4_v4l2m2m,msmpeg4v2,msmpeg4v3,msvideo1,nellymoser,opus,pam,pbm,pcm_alaw,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s8,pcm_s8_planar,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcx,pgm,pgmyuv,phm,png,ppm,qoi,qtrle,r10k,r210,ra_144,rawvideo,roq,roq_dpcm,rpza,rv10,rv20,s302m,sbc,sgi,smc,snow,sonic,sonic_ls,speedhq,srt,ssa,subrip,sunrast,svq1,targa,text,tiff,truehd,tta,ttml,utvideo,v210,v308,v408,v410,vc1_qsv,vc1_v4l2m2m,vc2,vnull,vorbis,vp8_qsv,vp8_v4l2m2m,vp8_vaapi,vp9_qsv,vp9_vaapi,wavpack,wbmp,webvtt,wmav1,wmav2,wmv1,wmv2,wrapped_avframe,xbm,xface,xsub,xwd,y41p,yuv4,zlib,zmbv,' \
    --enable-decoder=',aasc,libfdk_aac,ac3,acelp_kelvin,adpcm_4xm,adpcm_adx,adpcm_afc,adpcm_agm,adpcm_aica,adpcm_argo,adpcm_ct,adpcm_dtk,adpcm_ea,adpcm_ea_maxis_xa,adpcm_ea_r1,adpcm_ea_r2,adpcm_ea_r3,adpcm_ea_xas,adpcm_g722,adpcm_g726,adpcm_g726le,adpcm_ima_acorn,adpcm_ima_alp,adpcm_ima_amv,adpcm_ima_apc,adpcm_ima_apm,adpcm_ima_cunning,adpcm_ima_dat4,adpcm_ima_dk3,adpcm_ima_dk4,adpcm_ima_ea_eacs,adpcm_ima_ea_sead,adpcm_ima_iss,adpcm_ima_moflex,adpcm_ima_mtf,adpcm_ima_oki,adpcm_ima_qt,adpcm_ima_qt_at,adpcm_ima_rad,adpcm_ima_smjpeg,adpcm_ima_ssi,adpcm_ima_wav,adpcm_ima_ws,adpcm_ms,adpcm_mtaf,adpcm_psx,adpcm_sbpro_2,adpcm_sbpro_3,adpcm_sbpro_4,adpcm_swf,adpcm_thp,adpcm_thp_le,adpcm_vima,adpcm_xa,adpcm_xmd,adpcm_yamaha,adpcm_zork,alac,alias_pix,amrnb,amrwb,amv,anm,ansi,anull,apac,ape,apng,arbc,argo,ass,asv1,asv2,atrac1,atrac3,atrac3al,atrac3p,atrac3pal,aura,aura2,av1,av1_qsv,bethsoftvid,bfi,bink,binkaudio_dct,binkaudio_rdft,bintext,bitpacked,bmp,bmv_audio,bmv_video,bonk,brender_pix,c93,cbd2_dpcm,ccaption,cdgraphics,cdtoons,cdxl,cinepak,clearvideo,cljr,cook,cpia,cscd,cyuv,dca,dds,derf_dpcm,dfa,dfpwm,dirac,dnxhd,dolby_e,dpx,dsd_lsbf,dsd_msbf,dsicinaudio,dsicinvideo,dss_sp,dvaudio,dvbsub,dvdsub,dvvideo,dxa,dxtory,eacmv,eamad,eatgq,eatgv,eatqi,eightbps,eightsvx_exp,eightsvx_fib,escape124,escape130,evrc,exr,ffv1,ffvhuff,ffwavesynth,fits,flac,flashsv,flashsv2,flic,flv,fmvc,fourxm,ftr,g723_1,g729,gdv,gem,gif,gremlin_dpcm,gsm,gsm_ms,gsm_ms_at,h261,h263,h263_v4l2m2m,h263i,h263p,hap,hca,hcom,hdr,hnm4_video,hq_hqa,hqx,huffyuv,hymt,iac,idcin,idf,iff_ilbm,ilbc,imc,indeo2,indeo3,indeo4,indeo5,interplay_acm,interplay_dpcm,interplay_video,ipu,jacosub,jpeg2000,jpegls,jv,kgv1,kmvc,lagarith,libaribb24,libaribcaption,libaom,libaom_av1,libcodec2,libdav1d,libgsm,libgsm_ms,libilbc,libjxl,libopencore_amrnb,libopencore_amrwb,libopenh264,libopenjpeg,libopus,librsvg,libschroedinger,libspeex,libvorbis,libvpx_vp8,libvpx_vp9,libzvbi_teletext,loco,lscr,m101,mace3,mace6,mdec,media100,metasound,microdvd,mimic,misc4,mjpeg,mjpeg_qsv,mjpegb,mlp,mmvideo,motionpixels,mp1,mp1float,mp2,mp2float,mp3,mp3adu,mp3adufloat,mp3float,mp3on4,mp3on4float,mpc7,mpc8,mpeg1_v4l2m2m,mpeg1video,mpeg2_qsv,mpeg2_v4l2m2m,mpeg2video,mpeg4,mpeg4_v4l2m2m,mpegvideo,mpl2,msa1,mscc,msmpeg4v1,msmpeg4v2,msmpeg4v3,msnsiren,msp2,msrle,mss1,mss2,msvideo1,mszh,mts2,mv30,mvc1,mvc2,mvdv,mvha,mwsc,mxpeg,nellymoser,nuv,on2avc,opus,paf_audio,paf_video,pam,pbm,pcm_alaw,pcm_bluray,pcm_dvd,pcm_f16le,pcm_f24le,pcm_f32be,pcm_f32le,pcm_f64be,pcm_f64le,pcm_lxf,pcm_mulaw,pcm_s16be,pcm_s16be_planar,pcm_s16le,pcm_s16le_planar,pcm_s24be,pcm_s24daud,pcm_s24le,pcm_s24le_planar,pcm_s32be,pcm_s32le,pcm_s32le_planar,pcm_s64be,pcm_s64le,pcm_s8,pcm_s8_planar,pcm_sga,pcm_u16be,pcm_u16le,pcm_u24be,pcm_u24le,pcm_u32be,pcm_u32le,pcm_u8,pcm_vidc,pcx,pfm,pgm,pgmyuv,pgssub,pgx,phm,photocd,pictor,pjs,png,ppm,prosumer,psd,ptx,qcelp,qdm2,qdmc,qdraw,qoa,qoi,qpeg,qtrle,r10k,r210,ra_144,ra_288,rasc,rawvideo,realtext,rka,rl2,roq,roq_dpcm,rpza,rscc,rv10,rv20,s302m,sami,sanm,sbc,screenpresso,sdx2_dpcm,sgi,sgirle,shorten,simbiosis_imx,sipr,siren,smackaud,smacker,smc,smvjpeg,snow,sol_dpcm,sonic,sp5x,speedhq,speex,srgc,srt,ssa,stl,subrip,subviewer,subviewer1,sunrast,svq1,svq3,tak,targa,targa_y216,tdsc,text,theora,thp,tiertexseqvideo,tiff,tmv,truehd,truemotion1,truemotion2,truemotion2rt,truespeech,tscc,tscc2,tta,twinvq,txd,ulti,utvideo,v210,v210x,v308,v408,v410,vb,vble,vcr1,vmdaudio,vmdvideo,vmnc,vnull,vorbis,vp3,vp4,vp5,vp6,vp6a,vp6f,vp7,vp8,vp8_qsv,vp8_v4l2m2m,vp9,vp9_qsv,vp9_v4l2m2m,vplayer,vqa,vqc,wady_dpcm,wavarc,wavpack,wbmp,wcmv,webp,webvtt,wmav1,wmav2,wmavoice,wmv1,wmv2,wnv1,wrapped_avframe,ws_snd1,xan_dpcm,xan_wc3,xan_wc4,xbin,xbm,xface,xl,xpm,xsub,xwd,y41p,ylc,yop,yuv4,zero12v,zerocodec,zlib,zmbv,'

RUN make -j 6

RUN make install

ENTRYPOINT ["/usr/bin/ffmpeg", "$@"]
